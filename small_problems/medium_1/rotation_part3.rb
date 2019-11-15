# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# Example:

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

=begin
input: integer
output: maximum rotation of that integer
rules
explicit: may use rotate_rightmost_digits method from previous exercise
implicit: drop leading zeros on final result
algorithm:
- to rotate leftmost digit:
use ranges and reassign: string = string[1..] + string[0]
- to do max rotation:
convert int into string array using #to_s and #chars
rotate once
do arr.size -1 times:
  arr = arr[0..idx] + arr[(idx + 1)..]
convert back to integer using #join and #to_i
=end

def rotate(arr)
  arr = arr[1..] << arr[0]
end

def max_rotation(num)
  arr = rotate(num.to_s.chars)
  (arr.size - 1).times do |idx|
    arr = arr[0..idx] + rotate((arr[(idx + 1)..]))
  end
  arr.join.to_i
end

# Further Exploration

# There is an edge case in our problem when the number passed in as the
# argument has multiple consecutive zeros. Can you create a solution that
# preserves zeros?

# The above version takes care of this edge case
