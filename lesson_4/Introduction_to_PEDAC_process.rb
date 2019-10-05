# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: an array of substrings
# rules:
#   explicit:
#     1. Each output string is a palindromic substring of the original string
#     2. Palindromes are case senstive
#   implicit:
#     1. Substrings can begin and end with any character, not just a space
#     2. Palindromic substrings can be nested inside other palindromic substrings
#     3. For a blank string, output an empty array
# data structure: array
# algorithm: Iterate through string. At each letter, start a new loop checking
# to see whether letter at idx + 1 = letter at idx - 1; if so, add to list of
# palindromic substrings and keep expanding outwards, doing check and adding
# substring, until check is negative or index gives nil -- at that point move
# on to next letter


