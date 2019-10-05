# Letter Counter (Part 2)
# Modify the word_sizes method from the previous exercise to exclude
# non-letters when determining word size. For instance, the length of "it's" is
# 3, not 4.

# Examples
=begin
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
=end

# input: string with one or more space separated words
# output: hash with key => word size and value => occurrences
# --rules--
# explicit:
# -exclude non-letters in determining word size (but continue to only break
# words on spaces
# algorithm and data structures:
# 1. Initialize empty hash
# 2. Split string and iterate through words.
#   a. hash[word.size] = hash.fetch(word.size, 0) + 1
# 3. Return hash

def remove_punctuation(word)
  word.gsub(/[^a-z]/i, '')
end

def word_sizes(string)
  freq = Hash.new(0)
  string.split.each do |word|
    word = remove_punctuation(word)
    freq[word.size] += 1
  end
  freq
end
