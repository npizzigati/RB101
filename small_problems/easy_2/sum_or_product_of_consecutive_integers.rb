# Sum or Product of Consecutive Integers
# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# Input: Integer > 0
# Output: Sum or Product (user choice) of 1..input
# Algorithm: Prompt user for integer and whether they want to compute sum or
# product, validating all input. To calculate sum or product, use inject

def retrieve_integer
  input = nil
  loop do
    print 'Enter an integer greater than 0: '
    input = gets.chomp
    break if input =~ /^\d+$/ and input.to_i > 0
    puts input
    puts 'Try again.'
  end

  input.to_i
end

def retrieve_operation
  input = nil
  loop do
    print "Enter 's' for sum or 'p' for product: "
    input = gets.chomp.downcase
    break if %w{s p}.include?(input)
    puts 'Try again.'
  end

  input == 's' ? 'sum' : 'product'
end

def calculate(user_int, operation)
  op_symbol = operation == 'sum' ? :+ : :*
  (1..user_int).inject(op_symbol)
end

if __FILE__ == $PROGRAM_NAME
  user_int = retrieve_integer
  operation = retrieve_operation
  result = calculate(user_int, operation)
  puts "The #{operation} of the integers " \
       "between 1 and #{user_int} is #{result}"
end
