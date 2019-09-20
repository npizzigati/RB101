# Searching 101
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

# Inputs: 6 integers
# Output: string message indicating whether 6th number appears among first 5
# numbers
# Algorithm: Prompt user to enter 6 numbers. Validate and then push each to
# array. Then, pop off last number and see if remaining array includes it.

ENDINGS = { 1 => 'st', 2 => 'nd', 3 => 'rd', 4 => 'th', 5 => 'th' }

def retrieve_numbers
  numbers = []
  (1..6).each do |x|
    input = nil
    loop do
      if x < 6
        print "Enter the #{(x).to_s}#{ENDINGS[x]} number: "
      else
        print "Enter the last number: "
      end

      input = gets.chomp
      break if input =~ /^\d+$/
    end

    numbers << input.to_i
  end

  numbers
end

if __FILE__ == $PROGRAM_NAME
  numbers = retrieve_numbers
  sixth_number = numbers.pop
  print "The number #{sixth_number} "
  print numbers.include?(sixth_number) ? "appears " : "does not appear "
  puts "in #{numbers.inspect}."
end
