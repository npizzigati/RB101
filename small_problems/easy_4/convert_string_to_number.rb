# Convert a String to a Number!

# The String#to_i method converts a string of numeric characters (including an
# optional plus or minus sign) to an Integer. String#to_i and the Integer
# constructor (Integer()) behave similarly. In this exercise, you will create a
# method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. Your method should do this the
# old-fashioned way and calculate the result by analyzing the characters in the
# string.

# Examples

# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# input: string of digits
# output: integer
# rules:
#   explicit:
#     - Assume all characters will be digits, and no + or - signs
#     - May not use #to_i, Integer(), etc.

# data structure: hash (for conversion of individual digits, array)
#   a. initialize hash to map characters to digits, e.g. '1' => 1, ...
#   b. reverse number string (#chars).
#   c. loop through reversed string, find integer in hash and multiply by
#   place, e.g. for first iteration do not multiply, second by then, third by
#   100. Add each integer to an array.
#   d. sum array to get final number

def string_to_integer(string)
  conversions = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                  '7' => 7, '8' => 8, '9' => 9, '0' => 0 }
  numbers = []
  string.reverse.chars.each_with_index do |char, idx|
    numbers << conversions[char] * (10 ** idx)
  end
  numbers.sum
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

# Further exploration:
# Write a hexadecimal_to_integer method that converts a string representing a
# hexadecimal number to its integer value.

# data structure: hash (for conversion of individual digits, array)
#   a. initialize hash to map characters to hex numbers, e.g. '1' => 1, ...
#   b. reverse number string (#chars).
#   c. loop through reversed string, find integer in hash and multiply by
#   place, e.g. for first iteration do not multiply, second by 16 ** 2, third by
#   16 ** 3. Add each integer to an array.
#   d. sum array to get final number

def hexadecimal_to_integer(string)
  conversions = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
                  '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'A' => 10, 'B' => 11,
                  'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }
  numbers = []
  string.reverse.upcase.chars.each_with_index do |char, idx|
    numbers << conversions[char] * (16 ** idx)
  end
  numbers.sum
end

puts hexadecimal_to_integer('4D9f') == 19871
