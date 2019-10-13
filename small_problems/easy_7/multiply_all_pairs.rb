# Multiply All Pairs
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Examples:

# multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
input: two arrays each containing a list of numbers
output: an array containing the products of every possible combination of the
first and second arrays

rules
explicit
sort resulting array in ascending order
neither argument can be an empty array
implicit:
NA

algorithm:
use Array#product
obtain the product of the first array with the second one
map each subarray in the result array to the product of the subarray elements
sort
=end

def multiply_all_pairs(ary1, ary2)
  ary1.product(ary2).map { |subary| subary.inject(&:*) }.sort
end
