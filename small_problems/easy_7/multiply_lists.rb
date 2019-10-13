# Multiply Lists
# write a method that takes two array arguments in which each array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

# Examples:

# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
input: two arrays of integer
output: single array containing the products of the input arrays at each index

rules
arguments contain the same number of elements
implicit:
NA
algorithm
use zip and inject
set a to zip of the two input arrays
iterate using map on the result
  use inject to calculate the product of each of the resulting arrays
=end

def multiply_list(array1, array2)
  array1.zip(array2).map do |zipped|
    zipped.inject(&:*)
  end
end
