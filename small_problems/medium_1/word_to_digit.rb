# Word to Digit Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the words 'zero',
# 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
# 'nine' converted to a string of digits.

# Example:

# word_to_digit('Please call me at five five five one two three
# four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'  Show
# Solution & Discussion

=begin
input: String containing numbers spelled out.
output: Same string except numbers must now be in numerical form
rules:
explicit:
-Output string should contain spelled out numbers in input string but
in numerical form
-Only convert input numbers from zero to ten.
implicit: numbers are only lowercase
=end

def convert_to_digit(string_number, numbers)
  numbers.index(string_number).to_s
end

def convert_phrase(phrase)
  number_words = %w(zero one two three four five six seven eight nine)
  words_to_numbers = number_words.inject({}) do |accum, word|
    accum.update({ word => number_words.index(word).to_s })
  end
  number_words.each do |word|
    phrase.gsub!(word, words_to_numbers[word])
  end
  phrase
end
