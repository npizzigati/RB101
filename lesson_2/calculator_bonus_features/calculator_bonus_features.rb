require 'yaml'

def crunch_numbers(n1, n2, op)
  input = case op
        when '1'
          n1 + n2
        when '2'
          n1 - n2
        when '3'
          n1 * n2
        when '4'
          if n2 == 0
            message('division_by_zero')
          else
            n1.to_f / n2.to_f
          end
        end

  # If answer ends in a ".0", convert to integer, so it looks better
  input == input.to_i ? input.to_i : input
end

def display_dots
  10.times do
    sleep(0.1)
    print '.'
  end
end

def set_language(lang)
  messages = Psych.load_file('messages.yml')
  # Define the #message method using the language parameter entered by the user
  # and the messages loaded from the yaml file
  define_method(:message) { |msg| "#{messages[msg][lang]}" }
end

def is_string_representation_of_float?(string)
  # Allow floats like ".1" and "1." but don't allow just a "."
  string =~ /(^-?\d*\.\d+$)|(^-?\d+\.\d*$)/
end

def is_string_representation_of_integer?(string)
  string =~ /^-?\d+$/
end

def prompt_for_number(position)
  loop do
    print message(position)
    input = gets.chomp
    if is_string_representation_of_float?(input)
      return input.to_f
    elsif is_string_representation_of_integer?(input)
      return input.to_i
    end
    # if input is not a valid number, print message and repeat loop
    puts message('integer_or_float')
  end
end

def prompt_for_operation
  input = nil
  puts message('menu')
  loop do
    input = gets.chomp
    break if %{1 2 3 4}.include?(input)
    # if input is not a valid choice, print message and repeat loop
    puts message('menu_choices')
  end

  input
end

def do_it_again?
  again = nil

  loop do
    print message('again')
    input = gets.chomp.downcase
    if input == '1' || input == ''
      again = true
      break
    elsif input == '2'
      again = false
      break
    else
      puts message('1_or_2')
    end
  end

  again
end

def prompt_for_language
  input = nil
  loop do
    print "Enter 1 for English. Ingresa 2 para Español. "
    input = gets.chomp
    break if input == '1' || input == '2'
  end
  {'1' => 'en', '2' => 'es'}[input]
end

if __FILE__ == $PROGRAM_NAME
  lang_id = prompt_for_language
  set_language(lang_id)
  puts message('welcome')
  loop do
    number1 = prompt_for_number('first')
    number2 = prompt_for_number('second')
    operation = prompt_for_operation
    print "#{number1} #{message(operation)} #{number2} #{message('is')}"
    display_dots
    puts crunch_numbers(number1, number2, operation)
    break unless do_it_again?
  end
  puts message('thanks')
end
