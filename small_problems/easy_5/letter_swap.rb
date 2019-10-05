# Letter Swap
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces

# Examples:

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# input: string of words separated by spaces
# output: string with first and last letters of each word swapped
# --rules--
# explicit: every word contains at least one letter
#           string will contain at least one word
#           string contains nothing but words and spaces
# implicit: I assume no punctuation
# data structures: array
# algorithm:
#   1. split words into array
#   2. iterate through array
#     a. at each word mutate word by swapping first and last letters
#       - use multiple assignment last, first = first, last
#   3. join array with space
# functions:
#   - single function should suffice

def letter_swap(string)
  arr = []
  string.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
    arr << word
  end
  arr.join(' ')
end

# Further Exploration
# How come our solution passes word into the swap_first_last_characters method
# invocation instead of just passing the characters that needed to be swapped?
# Suppose we had this implementation:

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end
# and called the method like this:

# swap_first_last_characters(word[0], word[-1])
# Would this method work? Why or why not?

# Answer: I don't believe this would work. The return value seems to be an
# array of [last letter, first letter], but I don't see how this mutates the
# words
