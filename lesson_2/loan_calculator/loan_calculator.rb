require 'yaml'

def valid?(input, validation_criteria:)
  # validation_criteria are passed in a hash of arbitrary length,
  # with each key being a symbol representing the validation
  # type, and each value being the criteria for that type.
  # Possible validation_criteria keys are:
  # :regex  # The value is the regex expression to match
  # :inc    # An array that must contain the input
  # :gt     # an integer or float that the input must be greater than
  # :lt     # an integer or float that the input must be less than
  valid_input = true
  validation_criteria.each do |criteria_type, criteria|
    valid_input = case criteria_type
                  when :regex
                    input =~ criteria
                  when :gt
                    input.to_f > criteria
                  when :lt
                    input.to_f < criteria
                  when :inc
                    criteria.include?(input)
                  end
    break unless valid_input
  end
  valid_input
end

def box(string)
  string_in_box = '┌' + '─' * (string.length + 2) + '┐' + "\n" +
                  '│ ' + string + ' │' + "\n" +
                  '└' + '─' * (string.length + 2) + '┘' + "\n"
  string_in_box
end

def localize_msg(message)
  # If this is the first time calling this method, prompt user for language.
  input = nil
  loop do
    puts 'Enter 1 for English. Ingresa 2 para Espaǹol.'
    input = gets.chomp
    break if %w{1 2}.include?(input)
  end
  lang = {'1' => 'en', '2' => 'es'}[input]
  # Load messages from yaml file into messages hash
  messages = Psych.load_file('messages.yml')
  # redefine #localize_msg method to use messages hash and lang parameter
  # set by user on subsequent calls
  define_method(:localize_msg) { |msg| messages[msg][lang] }
  # on first call, clear screen after language choice, before displaying
  # welcome message
  system('clear') || system('cls')
  # on first call, return localized message (welcome message)
  messages[message][lang]
end

def prompter(msg, prevalidation_conversion: nil, validation_criteria:,
             invalid_input_msg: nil)
  # prevalidation_conversion is a symbol mirroring the name of the
  # conversion method; possible conversion methods are
  # #remove_currency_punctuation, #remove_percent_sign, #remove_years_text
  #
  # for info on validation_criteria see #valid?
  #
  input = nil
  loop do
    print localize_msg(msg)
    input = gets.chomp
    input = send(prevalidation_conversion, input) if prevalidation_conversion
    break if valid?(input, validation_criteria: validation_criteria)

    puts localize_msg(invalid_input_msg) if invalid_input_msg
  end

input
end

def remove_currency_punctuation(input)
  input.gsub(/\$|,/, '')
end

def remove_percent_sign(input)
  input.gsub(/%| /, '')
end

def remove_years_text(input)
  input.gsub(/years|year|años|año| /, '')
end

def retrieve_loan_amount
  input = prompter('loan_amount',
                   prevalidation_conversion: :remove_currency_punctuation,
                   validation_criteria: {regex: /^\d{1,8}\.?\d{0,2}$/, gt: 0},
                   invalid_input_msg: 'enter_valid_amount')
  input.to_f
end

def retrieve_apr
  input = prompter('apr',
                   prevalidation_conversion: :remove_percent_sign,
                   validation_criteria: {regex: /^\d{1,2}\.?\d{0,4}$/, gt: 0},
                   invalid_input_msg: 'enter_valid_percentage')
  input.to_f / 100
end

def retrieve_loan_years
  input = prompter('loan_years',
                   prevalidation_conversion: :remove_years_text,
                   validation_criteria: {regex: /^\d{1,2}$/, gt: 0},
                   invalid_input_msg: 'enter_valid_years')
  input.to_i
end

def calculate_monthly_payment(loan_amount, apr, loan_years)
  loan_months = loan_years * 12
  monthly_interest_rate = apr / 12
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 +
                    (monthly_interest_rate))**(-loan_months)))
  monthly_payment
end

def do_it_again?
  input = prompter('again',
                   prevalidation_conversion: :remove_years_text,
                   validation_criteria: {regex: /^[ysn]$|^yes$|^sí$|^no$/i},
                   invalid_input_msg: 'enter_y_or_n')
  input =~ /^[ys]$|^yes$|^sí$|^si$/i
end

if __FILE__ == $PROGRAM_NAME
  puts box(localize_msg('welcome'))

  loop do
    loan_amount = retrieve_loan_amount
    apr = retrieve_apr
    loan_years = retrieve_loan_years
    monthly_payment = calculate_monthly_payment(loan_amount, apr, loan_years)
    print "\n" + localize_msg('your_monthly_payment_is')
    print sprintf('%.2f', monthly_payment.round(2, half: :even))
    print localize_msg('which_you_will_be_paying_for_the_next')
    print loan_years * 12
    puts localize_msg('months')
    print "\n"
    break unless do_it_again?
    print "\n"
  end

  puts localize_msg('goodbye')
end
