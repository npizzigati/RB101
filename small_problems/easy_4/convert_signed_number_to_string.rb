# Convert a Signed Number to a String!
# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

# input: an integer, optionally negative
# output: a string representation of integer
# rules:
# explicit:
#   same as last exercise, with the exeption now that a negative number can be
#   passed as the method argument

# algorithm
# if number < 0 prepend a '-' to the string result of
# integer_to_string(integer.abs)

def signed_integer_to_string(integer)
  sign = ''
  if integer < 0
    sign = '-'
  elsif integer > 0
    sign = '+'
  end
  integer_to_string(integer.abs).prepend(sign)
end

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



puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
