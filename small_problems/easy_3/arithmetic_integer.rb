# Arithmetic Integer
# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not worry
# about validating the input.

# Example

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

# Input: Two positive integers
# Outputs: Results of +, - *, /, %, ** on the two integers

ORDINALS = { 1 => 'first', 2 => 'second' }

def retrieve_input
  numbers = []
  (1..2).each do |x|
    print "Enter the #{ORDINALS[x]} number: "
    numbers << gets.chomp.to_i
  end

  numbers
end

def crunch(numbers)
  operations = [:+, :-, :*, :/, :%, :**]
  operations.each do |op|
    puts "#{numbers[0]} #{op} #{numbers[1]} = #{numbers.inject(op)}"
  end
end

if __FILE__ == $PROGRAM_NAME
  numbers = retrieve_input
  crunch(numbers)
end
