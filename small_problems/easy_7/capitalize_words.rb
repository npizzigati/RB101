# Capitalize Words
# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples

# word_cap('four score and seven') == 'Four Score And Seven'
# word_cap('the javaScript language') == 'The Javascript Language'
# word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

input: string
output: string with first letter of each word capitalized and all other words
lowercase

rules
explicit:
words are any sequence of non-blank characters
implicit:
if word starts with a non-letter, no letters in that word are capitalized

algorithm:
using String#capitalize:
split string
iterate through words and capitalize words using String#capitalize
join string
return string

=end

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

# Further Exploration
# Ruby conveniently provides the String#capitalize method to capitalize
# strings. Without that method, how would you solve this problem? Try to come
# up with at least two solutions.

=begin

algorithm 1
rewrite #capitalize
# set entire string to downcase and then letter at idx 0 to upcase

=end
def mycapitalize(word)
  word.upcase[0] + word.downcase[1..]
end

def word_cap2(string)
  string.split.map { |word| mycapitalize(word) }.join(' ')
end

=begin
algorithm 2
downcase entire string
capitalize first char and characters after spaces
to find characters after spaces, find the index of all spaces recursively using
rindex
=end


def word_cap3(string)
  new_str = ''
  space_indices = find_space_indices(string)
  cap_indices = [0] + (space_indices.reverse.map { |e| e + 1 })
  string.chars.each_with_index do |e, idx|
    new_str += (cap_indices.include?(idx)) ? e.upcase : e.downcase
  end
  new_str
end

def find_space_indices(string)
  spa_idx = string.rindex(' ')
  return [] if spa_idx == nil
  [spa_idx] + find_space_indices(string[0...spa_idx])
end

