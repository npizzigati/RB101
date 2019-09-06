# List of Digits
# Write a method that takes one argument, a positive integer, and returns a
# list of the digits in the number.
# 
# Examples:
# 
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# Problem:
# Inputs: 1 positive integer
# Outputs: List of digits in number. Numbers are integers, not strings. 
# Question: What happens with scientific notation? -> These appear to be
# floats, so they will get caught in the validation

# Ex / Test Cases
# See above

# Data Structures and Algorithms
# List
# Validate that input is integer. Convert to string then split into array.

def list_digits(num)
  return unless num.is_a?(Integer)
  num.to_s.chars.map {|num| num.to_i}
end
