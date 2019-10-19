# Sum of Sums
# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the
# Array always contains at least one number.

# Examples:

# sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)
# -> (36)
# sum_of_sums([3, 5, 2]) == 21
# sum_of_sums([1, 5, 7, 3]) == 36
# sum_of_sums([4]) == 4
# sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin

input: array of numbers
output: sums of leading subsequences

rules:
explicit
Array will always contain at least one number.
implicit:
NA

algorithm
Use inject
to get leading sequences:
arr.inject([]) { |accum, e| accum << accum[accum.size - 1] || [] + [e]}
then sum up each leading sequence using map
=end

def sum_of_sums(arr)
  leading_seqs = arr.inject([]) do |accum, e|
    accum << (accum[accum.size - 1] || []) + [e]
  end
  leading_seqs.map { |e| e.sum }.sum
end


