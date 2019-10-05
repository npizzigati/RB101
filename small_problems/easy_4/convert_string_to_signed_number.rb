# Convert a String to a Signed Number!

# In the previous exercise, you developed a method that converts simple numeric
# strings to Integers. In this exercise, you're going to extend that method to
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading + or - sign; if the first
# character is a +, your method should return a positive number; if it is a -,
# your method should return a negative number. If no sign is given, you should
# return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc. You may, however, use the
# string_to_integer method from the previous lesson.

# Examples

# input: string of digits optionally preceded by a sign
# output: a signed integer

# rules:
#   explicit:
#     1. Return positive integer if sign is + or none
#     2. Return negative integer if sign is -

# algorithm: if the character at index 0 of the string is a - sign, multiply
# number obtained by #string_to_integer by -1

def string_to_integer(string)
  conversions = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                  '7' => 7, '8' => 8, '9' => 9, '0' => 0 }
  numbers = []
  string.reverse.chars.each_with_index do |char, idx|
    numbers << conversions[char] * (10 ** idx)
  end
  numbers.sum
end

def string_to_signed_integer(string)
  if string[0] == '-'
    string_to_integer(string[1..-1]) * -1
  elsif string[0] == '+'
    string_to_integer(string[1..-1])
  else
    string_to_integer(string)
  end
end

# Further Exploration

# In our solution, we call string[1..-1] twice, and call string_to_integer
# three times. This is somewhat repetitive. Refactor our solution so it only
# makes these two calls once each.


def string_to_signed_integer2(string)
  start = 0
  factor = 1
  case string[0]
  when '-'
    factor = -1
    start = 1
  when '+'
    start = 1
  end
  string_to_integer(string[start..-1]) * factor
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
puts string_to_signed_integer2('4321') == 4321
puts string_to_signed_integer2('-570') == -570
puts string_to_signed_integer2('+100') == 100
