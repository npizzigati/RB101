# When will I Retire?
# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# Inputs: Current age, desired retirement age (2 strings entered by user and
# converted to integers).
# Outputs: Current date, desired retirement date (4-digit years), and number of
# years left until retirement
# Algorithm: Prompt user for current age and desired retirement age. Validate
# and convert both into integers. Also validate that retirement age is greater
# than current age. Subtract current age from desired retirement
# age to get years left until retirement. Get current year. Add years left
# until retirement to get retirement year.

require 'date'

def valid_age?(age)
  age =~ /^\d{1,3}$/ && age.to_i.between?(1, 120)
end

def retrieve_age(stage)
  age = nil
  loop do
    print "What is your #{stage} age: "
    age = gets.chomp
    if not valid_age?(age)
      puts 'Age must be a valid number between 1 and 120'
    else
      break
    end
  end
  age.to_i
end


if __FILE__ == $PROGRAM_NAME
  current_age, retirement_age = [nil, nil]
  loop do
    current_age = retrieve_age('current')
    retirement_age = retrieve_age('desired retirement')
    break if retirement_age > current_age
    puts 'Time machines do not yet exist'
  end
  current_year = Date.today.year
  years_to_retire = retirement_age - current_age
  puts "It's #{current_year}. You will retire in #{current_year +
                                                   years_to_retire }."
  puts "You only have #{years_to_retire} years of work to go!"
end
