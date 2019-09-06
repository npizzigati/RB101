# Reverse It (Part 1)
# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.
# 
# Examples:
# 
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# The tests above should print true.

# Input: 1 string
# Output: 1 string consisting of the words in the input string in reverse order 
# Test cases: see above 
# Questions: Should I split on punctuation too?
# Data structures and Algorithms: string (input) -> array (processing) -> string (output) 
# If the original string input is not a string, return 'Input not a string'. If
# input is '' return ''. Otherwise split string into array, reverse, and then
# join array back into string. 

def reverse_sentence(user_str)
  return unless user_str.is_a?(String)
  return '' if user_str == ''
  return user_str.split(' ').reverse.join(' ')
end

