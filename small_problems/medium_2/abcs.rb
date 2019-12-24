# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this
# list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once.

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

# Examples:

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

=begin
problem
*******
input: a string
output: true or false (return value)

rules
*****
explicit: - True is returned is the arg can be spelled with blocks given, false
            otherwise
          - Cannot use both letters from same block
          - Each block can only be used once
implicit: - case of input does not matter
question: - Should input be validated? Guessing no.

data structures and algorithms
******************************
Use an array of arrays. Each subarray is one of the block pairs. For each input,
iterate through the letters. At each iteration, find the subarray with the
letter in question and remove it from the containing array. If all the letters
are found, return true, otherwise if any of the letters are not found return
false.
=end


def block_word?(word)
  blocks = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
            ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
            ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

  word.upcase.chars.each do |letter|
    found_index = blocks.rindex { |subarray| subarray.include? letter }
    return false if found_index.nil?
    blocks.delete_at(found_index)
  end
  true
end
