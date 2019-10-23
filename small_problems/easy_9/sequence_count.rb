# Sequence Count
# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
# create. The method should return an Array that contains the same number of
# elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count is
# 0, an empty list should be returned.

# Examples:

# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []

=begin
input: 2 integers
output: array
rules:
explicit:
1st input arg is a count; 2nd is the first number of a sequence that method will create
return array contains count number of elements and values are multiples of starting number
implicit: a count of zero will always produce an empty array

algorithm:
initialize an empty array arr
count times do
  push arr.last (or 0 if arr is empty) plus arg2 onto array
=end

def sequence(count, num)
  arr = []
  count.times { |idx| arr << num * (idx + 1) }
  arr
end
