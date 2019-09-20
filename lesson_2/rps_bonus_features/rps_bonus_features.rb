require 'io/console'

CHOICES = { r: 'rock', p: 'paper', s: 'scissors', k: 'Spock', l: 'lizard' }

def retrieve_user_choice
  print prompt('Choose: ')
  puts '(r)ock, (p)aper, (s)cissors, Spoc(k), (l)izard or (q)uit'
  input = nil
  loop do
    input = STDIN.getch.downcase
    break if %w{r p s k l q}.include?(input)
    puts 'Enter r, p, s, k, l or q'
  end

  CHOICES[input.to_sym]
end

def retrieve_outcome(player1, player2)
  if player1 == player2
    return { result: 'TIE', gory_details: "" }
  end

  cycle_of_life = 'scissors cuts paper covers rock crushes lizard poisons ' \
    'Spock smashes scissors decapitates lizard eats paper disproves Spock ' \
    'vaporizes rock crushes scissors'

  p1_beats_p2 = /(#{player1})\s\w+\s#{player2}/
  p2_beats_p1 = /(#{player2})\s\w+\s#{player1}/

  match = p1_beats_p2.match(cycle_of_life) || p2_beats_p1.match(cycle_of_life)
  if match[1] == player1
    return { result: 'YOU WIN', gory_details: match[0] }
  else
    return { result: 'YOU LOSE', gory_details: match[0] }
  end
end

def display_results(human_player, computer_player, outcome)
  display_header
  print prompt("#{human_player} vs. #{computer_player}")
  sleep(1)
  print ' -- ' + outcome[:gory_details] unless outcome[:result] == 'TIE'
  puts ' -- ' + outcome[:result] + '!'
  sleep(1)
end

def display_final_match_details(score)
  print "Your final match score (wins-losses-ties) was "
  puts format("%1d-%1d-%1d.", score[:human], score[:computer], score[:tie])
end

def display_header
  string = CHOICES.values.join(' - ')
  5.times do |cnt|
    throw = CHOICES.values[cnt]
    throws_string = string.sub(/#{throw}/, throw.to_s.upcase)
    puts box(throws_string)
    sleep(0.3)
    clear_screen
  end
  puts box(string)
end

def clear_screen
  system('clear') || system('cls')
  puts "\n"
end

def box(string)
  string_in_box = '┌' + '─' * (string.length + 2) + '┐' + "\n" \
                  '│ ' + string + ' │' + "\n" \
                  '└' + '─' * (string.length + 2) + '┘' + "\n"
  string_in_box
end

def prompt(string)
  '=> ' + string
end

if __FILE__ == $PROGRAM_NAME
  score = { human: 0, computer: 0, tie: 0 }
  clear_screen
  display_header
  loop do
    print "\nThrow No. #{score.values.sum + 1} "

    human_player = retrieve_user_choice
    break unless human_player

    computer_player = CHOICES.values.sample

    clear_screen

    outcome = retrieve_outcome(human_player, computer_player)

    case outcome[:result]
    when 'YOU WIN'
      score[:human] += 1
    when 'YOU LOSE'
      score[:computer] += 1
    else
      score[:tie] += 1
    end

    display_results(human_player, computer_player, outcome)

    if score[:human] == 5
      print "\nYou have won the match! "
      break
    elsif score[:computer] == 5
      print "\nThe computer has won the match! "
      break
    end
  end

  display_final_match_details(score)
  print "Thanks for playing!\n\n"

end
