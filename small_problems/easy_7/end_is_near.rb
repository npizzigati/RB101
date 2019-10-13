# The End Is Near But Not Here
# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Examples:

# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

=begin

input: string
output: next to last word in string
rules:
explicit:
words are any sequence of non-blank characters
input string will contain at least two words
implicit:
include punctuation as part of words
algorithm
split string
return element at idx -2 of result array
=end

def penultimate(string)
  string.split[-2]
end

# Further Exploration
# Our solution ignored a couple of edge cases because we explicitly stated that
# you didn't have to handle them: strings that contain just one word, and
# strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them? Write a method that returns the middle word of a
# phrase or sentence. It should handle all of the edge cases you thought of.

=begin
edge cases:
when array is empty: return an empty string
when array has a single element: return that element
when there are two possible middle words: return the first one

algorithm:
if string is empty return empty string
split string
for idx, divide (int division) size by 2
return word at that idx
=end

def middle(string)
  return '' if string == ''
  words = string.split
  len = words.size
  idx = (len.even?) ? len / 2 - 1 : len / 2
  words[idx]
end
