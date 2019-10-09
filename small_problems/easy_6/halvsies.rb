# Halvsies
# Write a method that takes an Array as an argument, and returns two Arrays (as
# a pair of nested Arrays) that contain the first half and second half of the
# original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.

# Examples:

# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

=begin
input: an array
output: a pair of nested arrays, containing the first and second half of the
  original array, respectively

rules...
explicit:
if original array contains off number of elements, middle element should be
  placed in first array
implicit:
An empty array will produce two nested empty arrays

algorithm and data structures:
create a new array containing the two nested arrays created by slicing the
  original array at the half point
to deal with the odd length possibility use divmod(2) on the length and add the
  remainder to the halfway point
=end

def halvsies(ary)
  halfway, adj = ary.size.divmod(2)
  [ary.slice(0...(halfway + adj)), ary.slice((halfway + adj)..)]
end
