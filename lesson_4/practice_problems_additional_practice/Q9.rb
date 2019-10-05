# Practice Problem 9
# As we have seen previously we can use some built-in string methods to change
# the case of a string. A notably missing method is something provided in
# Rails, but not in Ruby itself...titleize. This method in Ruby on Rails
# creates a string that has each word capitalized as it would be in a title.
# For example, the string:

words = "the flintstones rock"
# would be:

# words = "The Flintstones Rock"
# Write your own version of the rails titleize implementation.

words_arr = words.split
capitalized = []
words_arr.each { |word| capitalized << (word[0].upcase + word[1..-1]) }
title_case_words = capitalized.join(' ')

puts title_case_words

# An attempt at one-lining this
title_case_words = words.split.each_with_object([]) { |word, arr| arr <<
  (word[0].upcase + word[1..-1])}.join(' ')

puts title_case_words

# AFAIK, String#capitalize has the disadvantage of downcasing letters idx 1..-1
