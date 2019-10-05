# Alphabetical Numbers
# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# Examples:

=begin
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

# input: array of integers 0..19
# output: array of same integers sorted based on the English words for each
# number
# --rules--
# explicit:
# - NA
# implicit:
# - NA
# algorithm and data structures (array):
# 1. Initialize array of number words num_words: zero..nineteen
# 2. use sort and send it the block num_words[a] <=> num_words[b]

def alphabetic_number_sort(ary)
  num_words = %w(zero one two three four five six seven eight
             nine ten eleven twelve thirteen fourteen fifteen
             sixteen seventeen eighteen nineteen)
  ary.sort { |a, b| num_words[a] <=> num_words[b] }
end
