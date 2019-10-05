# Convert a Number to a String!
# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

# input: integer
# output: string
# rules:
#   explicit: return string representation of integer
#   implicit: a value of 0 will result in '0'
# questions: negative numbers? validation of input?

# data structure: push each digit to an array, the join to string

# algorithm:
# Initialize array that digits will be pushed to.
# Initialize string that will be used to convert from integer digit to string
# digit using number index.
# Loop.
#   Take divmod of integer
#   push remainder to result array
#   Break when quotient == 0.
# Assign integer to quotient.
# Reverse result array and join to string, then return

def integer_to_string(integer)
  digit = '0123456789'
  converted = []
  loop do
    quotient, modulus = integer.divmod(10)
    converted << digit[modulus]
    break if quotient == 0
    integer = quotient
  end
  converted.reverse.join
end


puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
