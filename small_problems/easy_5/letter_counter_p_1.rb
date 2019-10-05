# letter counter (part 1)
# write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# words consist of any string of characters that do not include a space.

# examples
=begin
word_sizes('four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1,
           7 => 2 }
word_sizes("what's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
=end

# input: string with one or more space separated words
# output: hash with key => word size and value => occurrences
# --rules--
# explicit:
# -words consist of any string of characters not including a space
# implicit:
# -words include punctuation and other non-alphabetic chars
# algorithm and data structures:
# 1. Initialize empty hash
# 2. Split string and iterate through words.
#   a. hash[word.size] = hash.fetch(word.size, 0) + 1
# 3. Return hash

def word_sizes(string)
  freq = {}
  string.split.each do |word|
    freq[word.size] = freq.fetch(word.size, 0) + 1
  end
  freq
end
