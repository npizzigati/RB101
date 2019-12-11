# Rotation (Part 2)
# Write a method that can rotate the last n digits of a number. For example:

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
# Note that rotating just 1 digit results in the original number being
# returned.

# You may use the rotate_array method from the previous exercise if you want.
# (Recommended!)

# You may assume that n is always a positive integer.

=begin

input: two integers; second integer n is the number of digits to rotate
output: first integer with last n digits rotated
rules
explicit:
use #rotate_array from part 1
one digit number results in original number being returned
assume that n is always a positive integer
implicit: NA
algorithm:
convert to string and split into part that will be rotated and part that won't
using multiple assignment and indices
convert part that will be rotated into array and rotate, then join back
  together into string and add to other part
convert entire string back into integer
=end

require_relative './rotation_part1.rb'

def rotate_rightmost_digits(number, n)
  p1 = number.to_s.chars
  p2 = p1.pop(n)
  p2_r = rotate_array(p2)
  (p1 + p2_r).join.to_i
end
