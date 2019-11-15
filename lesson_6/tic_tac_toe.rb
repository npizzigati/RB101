require 'io/console'

# Configurable options
GOES_FIRST = :choose # possible choices are :human, :computer and :choose
MATCH_GAMES = 5

# Non-configurable options
BLANK_BOARD = [
  '       │       │       ',
  '       │       │       ',
  '       │       │       ',
  '───────┼───────┼───────',
  '       │       │       ',
  '       │       │       ',
  '       │       │       ',
  '───────┼───────┼───────',
  '       │       │       ',
  '       │       │       ',
  '       │       │       '
]

# Coordinates are [y, x]
COORDS = [[1, 3], [1, 11], [1, 19],
          [5, 3], [5, 11], [5, 19],
          [9, 3], [9, 11], [9, 19]]

COMPUTER = '𝗢'
HUMAN = '𝗫'

TINY_BOARD_NUMBERS = { '1' => '₁', '2' => '₂', '3' => '₃', '4' => '₄',
                       '5' => '₅', '6' => '₆', '7' => '₇', '8' => '₈',
                       '9' => '₉' }

IDX_OFFSET = 1

Node = Struct.new(:state, :children, :score)

def play_match
  stats = Hash.new(0)
  state = nil
  game_cnt = 0

  loop do
    state = %w(1 2 3 4 5 6 7 8 9)
    display(stats, state, :first) if game_cnt == 0
    display(stats, state)

    turn = who_goes_first == :computer ? COMPUTER : HUMAN

    play_single_game(state, turn, stats)
    game_cnt += 1

    break if game_cnt == MATCH_GAMES || !keep_playing?
  end

  if game_cnt == MATCH_GAMES
    display_match_results(stats, state)
  end
end

def play_single_game(state, turn, stats)
  loop do
    display(stats, state)
    state = place_piece(state, turn)

    if winner?(state, turn)
      # computer is unbeatable, so no way human wins
      stats[:computer_wins] += 1
      display(stats, state, 'Computer wins!')
      break
    elsif full?(state)
      stats[:ties] += 1
      display(stats, state, 'Tie game!')
      break
    end

    turn = other(turn)
  end
end

def display(stats=nil, state=nil, message=nil)
  clear_screen
  puts "UNBEATABLE TIC TAC TOE"
  show_match_score(stats) if stats

  puts update_board(state) if state

  if message == :first
    puts "Welcome to unbeatable TIC TAC TOE.\n" \
         "Best out of #{MATCH_GAMES} games wins. (The best you can do is tie.)"
    input("Press any key to continue...")
    return
  end

  if message
    puts message
  end
end

def who_goes_first
  if GOES_FIRST == :choose
    options = { 1 => :computer, 2 => :human }
    answer = input('Who goes first: (1: computer, 2: you)', ['1', '2'])
    return options[answer.to_i]
  end

  GOES_FIRST
end

def place_piece(state, turn)
  if turn == COMPUTER
    retrieve_computer_move(state)
  else
    retrieve_human_move(state)
  end
end

def update_board(state)
  board = BLANK_BOARD.dup
  state.each_with_index do |item, idx|
    y = COORDS[idx][0]
    x = COORDS[idx][1]
    tiny_number = TINY_BOARD_NUMBERS[item] if ('1'..'9').include?(item)
    board[y][x] = tiny_number || item
  end

  board
end

def retrieve_human_move(state)
  possible_moves = retrieve_possible_moves(state)
  move = nil
  loop do
    answer = input("Your move? (#{joinor(possible_moves)})")
    move = answer.to_i

    if valid_move?(move, state)
      break
    else
      puts "Not a valid move. Try again."
    end
  end

  state[move - IDX_OFFSET] = HUMAN
  state
end

def valid_move?(move, state)
  move.between?(1, 9) && !!(state[move - IDX_OFFSET] =~ /[1-9]/)
end

def retrieve_computer_move(state)
  puts "Computer's move..."
  sleep 0.5
  if virgen?(state)
    move = [1, 3, 5, 7, 9].sample
    state[move - IDX_OFFSET] = COMPUTER
    state
  else
    state.replace(retrieve_best_move(state))
  end
end

def retrieve_possible_moves(state)
  state.filter { |e| e =~ /\d/ }.map!(&:to_i)
end

def virgen?(state)
  retrieve_possible_moves(state).count { |e| (1..9).include?(e) } == 9
end

def winner?(state, turn)
  winning_combos = [[1, 2, 3], [4, 5, 6], [7, 8, 9],  # horizontals
                    [1, 4, 7], [2, 5, 8], [3, 6, 9],  # verticals
                    [1, 5, 9], [3, 5, 7]]             # diagonals
  winner = false

  winning_combos.each do |combo|
    combo.map! { |pos| state[pos - IDX_OFFSET] }
  end

  winning_combos.each do |combo|
    if combo.uniq == [turn]
      winner = true
      break
    end
  end

  winner
end

def retrieve_best_move(state)
  state_tree = minimax(Node.new(state, [], nil), COMPUTER)
  retrieve_score(state_tree)
  max_score = -1
  best_idx = 0
  state_tree.children.each.with_index do |child, idx|
    if child.score > max_score
      max_score = child.score
      best_idx = idx
    end
  end
  state_tree.children[best_idx].state
end

def minimax(node, turn=COMPUTER, max=true, memo_hsh=Hash.new)
  possible_moves = retrieve_possible_moves(node.state)

  if winner?(node.state, other(turn))
    node.score = max ? -1 : 1
    return
  elsif possible_moves.empty?
    node.score = 0
    return
  end

  memo_key = [node.state, turn].hash
  if !memo_hsh[memo_key].nil?
    node.children = memo_hsh[memo_key].children
    return
  end

  minimax_create_child_nodes(node, turn, possible_moves, max, memo_hsh)
  node
end

def minimax_create_child_nodes(node, turn, possible_moves, max, memo_hsh)
  possible_moves.each do |move|
    child_state = node.state.dup
    child_state[move - IDX_OFFSET] = turn
    node.children << Node.new(child_state, [], nil)
  end

  node.children.each do |child|
    other_turn = other(turn)
    minimax(child, other_turn, !max, memo_hsh)

    memo_key = [child.state, other_turn].hash
    memo_hsh[memo_key] = child
  end
end

def retrieve_score(node, max=true)
  children_scores = node.children.map do |child|
    if !child.score.nil?
      child.score
    else
      retrieve_score(child, !max)
    end
  end

  node.score = max ? children_scores.max : children_scores.min

  node.score
end

def other(turn)
  turn == HUMAN ? COMPUTER : HUMAN
end

def full?(state)
  possible_moves = retrieve_possible_moves(state)
  possible_moves.empty?
end

def input(prompt, valid_values=nil)
  # valid_values must be a list or a range
  answer = nil

  loop do
    puts prompt
    answer = STDIN.getch
    exit(1) if answer == "\u0003" # exit program on Ctrl-c
    break if !valid_values || valid_values.include?(answer)

    puts "Invalid input."
  end

  answer
end

def clear_screen
  system('clear') || system('cls')
  puts "\n"
end

def display_match_results(stats, state)
  # The computer is unbeatable, so no need to account for chance of human win
  frozen_board = update_board(state)
  results = case stats[:ties]
            when 5
              'Match was a tie!'
            when (1..4)
              'Computer wins match!'
            when 0
              'The computer ate your lunch.'
            end
  strobe(results, frozen_board, stats)
end

def show_match_score(stats)
  puts "Match score: Computer: #{stats[:computer_wins]}, " \
       "You: 0, Ties: #{stats[:ties]}"
end

def joinor(num_list)
  num_list[0..-2].map(&:to_s).join(', ') + ' or ' + num_list.last.to_s
end

def strobe(message, frozen_board, stats)
  20.times do |idx|
    display(stats)
    puts frozen_board
    if idx.even?
      puts message
    end
    sleep 0.1
  end
end

def keep_playing?
  answer = input("Press 'q' to quit match, any other key to continue playing.")
  answer.downcase != 'q'
end

if $PROGRAM_NAME == __FILE__
  play_match
end
