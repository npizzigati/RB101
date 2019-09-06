# Stringy Strings
# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# The tests above should print true.

# Input: 1 positive integer
# Output: 1 string of alternating 1s and 0s, starting with 1. Length of string
# matches given integer

# Test cases: see above

# Data Structures and Algorithms: 
# Given an integer x, loop x times, adding 1 to an array if the loop
# counter is even, or 0 if it is odd, then convert the
# array to a string and return it

def stringy(user_int) 
  ary = []
  user_int.times do |idx|
    if idx.even? 
      ary << 1
    else
      ary << 0
    end
  end
  ary.join('')
end

# Further Exploration
# Modify stringy so it takes an optional argument that defaults to 1. If
# the method is called with this argument set to 0, the method should
# return a String of alternating 0s and 1s, but starting with 0 instead
# of 1.

# inputs: 1 string, 1 optional integer that defaults to 1
# outputs: if optional integer provided is 0, series should start with 0,
# otherwise it should start with 1

def stringy2(user_int, start = 1) 
  ary = []
  if start == 0
    ary << 0
    user_int -= 1
  end
  user_int.times do |idx|
    if idx.even? 
      ary << 1 
    else
      ary << 0
    end
  end
  ary.join('')
end
