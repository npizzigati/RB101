# How long are you?
# Write a method that takes a string as an argument, and returns an Array that
# contains every word from the string, to which you have appended a space and
# the word length.

# You may assume that words in the string are separated by exactly one space,
# and that any substring of non-space characters is a word.

# Examples

# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []
=begin
input: string
output: array
rules
explicit:
return array contains each word and an integer of their length
words are separated by 1 space
any substring of non-space chars is a word
implicit:
an empty string will give the return value of an empty array

algorithm:
split string into words
map arr block each word => "word [length]"
=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}" }
end
