require 'io/console'

begin
  require_relative 'instructions.rb'
rescue LoadError
  open('error.log', 'a') do |f|
    f.puts "#{Time.now}: instructions.rb not found"
  end
end

TOP_SCORE = 21
DEALER_STAY = 17

# Coords are [y, x]
SUIT_COORDINATES = [[2, 1], [4, 5], [6, 9]]
VALUE_COORDINATES = [[1, 1], [7, 9]]

VALUE_AMOUNTS = { '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                  '6' => 6, '7' => 7, '8' => 8, '9' => 9,
                  '10' => 10, 'J' => 10, 'Q' => 10,
                  'K' => 10, 'A' => 11 }

SUIT_SYMBOLS = { spades: '♠', clubs: '♣', hearts: '♥', diamonds: '♦' }

BLANK_CARD_REPRESENTATION = [
  "┌─────────┐",
  "│         │",
  "│         │",
  "│         │",
  "│         │",
  "│         │",
  "│         │",
  "│         │",
  "└─────────┘"
]

def play_match
  show_instructions
  results = Hash.new(0)
  game_count = 0
  loop do
    game_count += 1
    play_game(results)
    break if game_count == 5 || quit?(game_count)
  end
  if game_count == 5
    display_results_summary(results)
  else
    puts "\nThanks for playing."
  end
end

def show_instructions
  clear_screen
  puts "Welcome to the game of Twenty-One. It's just like " \
       "Blackjack,\nbut with no splitting or doubling down.\n\n"
  answer = input("Press \"d\" to show detailed " \
                 "instructions, or any other key to begin.")
  show_detailed_instructions if answer == 'd'
end

def show_detailed_instructions
  clear_screen
  begin
    puts Instructions::DETAILED_INSTRUCTIONS
  rescue NameError
    puts "Detailed instructions not found. Please make sure " \
         "the file\ninstructions.rb is in the working directory" \
         " of the script.\n"
  end
  input("\nPress any key to start game.")
end

def play_game(results)
  deck = initialize_deck
  player = []
  dealer = []
  deal_initial_hand(deck, player, dealer)
  display_hands(results, dealer, player, :dealer_hide_first_card)

  player_score = player_turn(deck, player, dealer, results)

  unless player_score == :bust
    dealer_score = dealer_turn(deck, player, dealer, results)
  end

  update_results(player_score, dealer_score, results)
  display_hands(results, dealer, player)
  puts results[:last_game]
end

def initialize_deck
  suits = SUIT_SYMBOLS.keys
  values = VALUE_AMOUNTS.keys
  values.product(suits).shuffle
end

def player_turn(deck, player, dealer, results)
  loop do
    if player_hit?
      hit(player, deck)
      puts 'Dealing card...'
      sleep 0.7
      display_hands(results, dealer, player, :dealer_hide_first_card)
      return :bust if busts?(player)
    else
      return total(player)
    end
  end
end

def dealer_turn(deck, player, dealer, results)
  display_hands(results, dealer, player)
  loop do
    if dealer_should_hit?(dealer)
      puts "Dealer will hit..."
      hit(dealer, deck)
      sleep 1
      display_hands(results, dealer, player)
      sleep 0.5
      return :bust if busts?(dealer)
    else
      return total(dealer)
    end
  end
end

def display_hands(results, dealer, player, option=nil)
  clear_screen
  display_stats(results)
  if option == :dealer_hide_first_card
    dealer_hand_representation =
      generate_hand_representation(dealer, first_card_visible: false)
  else
    dealer_hand_representation =
      generate_hand_representation(dealer, first_card_visible: true)
  end

  player_hand_representation = generate_hand_representation(player)

  puts "\nDealer's hand:"
  puts dealer_hand_representation
  puts "\nYour hand:"
  puts player_hand_representation
  print "\n"
end

def update_results(player_score, dealer_score, results)
  if player_score == :bust
    results[:last_game] = 'Player busts. Dealer wins!'
    results[:dealer] += 1
  elsif dealer_score == :bust
    results[:last_game] = 'Dealer busts. Player wins!'
    results[:player] += 1
  elsif dealer_score > player_score
    results[:last_game] = "Dealer wins with #{dealer_score}!"
    results[:dealer] += 1
  elsif dealer_score < player_score
    results[:last_game] = "Player wins with #{player_score}!"
    results[:player] += 1
  else
    results[:last_game] = "Hand was a tie!"
    results[:ties] += 1
  end
end

def deal_initial_hand(deck, *participants)
  participants.each do |participant|
    2.times { add_card(participant, deck) }
  end
end

def add_card(participant, deck)
  participant << deck.pop
end

def count_aces(participant)
  participant.map { |card| card[0] }.count('A')
end

def dealer_should_hit?(dealer)
  total(dealer) < DEALER_STAY
end

def player_hit?
  answer = input('Press "h" to hit or any other key to stay. ')
  answer == 'h'
end

def hit(participant, deck)
  add_card(participant, deck)
end

def busts?(participant)
  total(participant) > TOP_SCORE
end

def total(participant)
  total = participant.inject(0) { |accum, (k, _)| accum + VALUE_AMOUNTS[k] }
  if total > TOP_SCORE
    aces = count_aces(participant)
    while aces > 0 && total > TOP_SCORE
      total -= 10
      aces -= 1
    end
  end
  total
end

def input(prompt)
  print prompt
  answer = STDIN.getch
  exit(1) if answer == "\u0003" # exit program on Ctrl-c
  answer
end

def display_stats(results)
  puts "Your stats (wins-losses-ties): #{results[:player]}-" \
       "#{results[:dealer]}-#{results[:ties]}"
end

def quit?(game_count)
  sleep 1
  prompt = 'Press "q" to quit match or any other key to continue.'

  if game_count == 1
    prompt += ' (Best of 5 games wins match.)'
  end

  answer = input(prompt)

  answer == 'q'
end

def display_results_summary(results)
  print "\nIn the best of five, "
  if results[:player] > results[:dealer]
    puts "you beat the house! Thanks for playing."
  elsif results[:player] < results[:dealer]
    puts "the house beat you. Better luck next time!"
  else
    puts "you came out even! Thanks for playing."
  end
end

def generate_hand_representation(hand, first_card_visible: true)
  if first_card_visible == false
    hand_representation = generate_card_back_representation
  else
    first_value, first_suit = hand[0]
    hand_representation = generate_card_representation(first_value, first_suit)
  end
  hand[1..-1].each do |(value, suit)|
    card_representation = generate_card_representation(value, suit)
    hand_representation = add_to_hand(hand_representation, card_representation)
  end

  hand_representation
end

def add_to_hand(hand_representation, card_representation)
  hand_representation.map!.with_index do |line_in_hand, line_number|
    line_in_hand + '  ' + card_representation[line_number]
  end
end

def generate_card_representation(value, suit)
  card_representation = deep_copy_card_representation(BLANK_CARD_REPRESENTATION)

  VALUE_COORDINATES.each do |coordinates|
    # Prevent 2-digit number from messing up card alignment
    if value == '10'
      position_2_digit_number(coordinates, card_representation, value)
    else
      y, x = coordinates
      card_representation[y][x] = value
    end
  end

  SUIT_COORDINATES.each do |(y, x)|
    card_representation[y][x] = SUIT_SYMBOLS[suit]
  end

  card_representation
end

def deep_copy_card_representation(card_representation)
  card_representation.map(&:dup)
end

def position_2_digit_number(coordinates, card_representation, value)
  y, x = coordinates
  if y == 1 # Top-left position
    card_representation[y][x] = value[0]
    card_representation[y][x + 1] = value[1]
  else # Bottom-right position
    card_representation[y][x - 1] = value[0]
    card_representation[y][x] = value[1]
  end
end

def generate_card_back_representation
  card_representation = BLANK_CARD_REPRESENTATION.dup
  card_representation.map! do |line|
    if line == "│         │"
      "│░░░░░░░░░│"
    else
      line
    end
  end
  card_representation
end

def clear_screen
  system('clear') || system('cls')
  puts "\n"
end

if $PROGRAM_NAME == __FILE__
  play_match
end
