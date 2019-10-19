# Palindromic Substrings
# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

# Examples:

# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

=begin
input: string
output: palindromic substrings of input string

rules:
explicit:
return value should be arranged in same sequence as substrings appear in str
duplicate palindromes should be included multiple times
use substrings method we created in previous exercise
consider all characters
case sensitive
single characters are not palindromes
implicit:
NA

algorithm:
use substrings method to get substrings
filter substrings with block: substring equals substring.reverse &&
  substring.size > 1

=end

def substrings(string)
  return [] if string.empty?
  Array.new(string.size) { |idx| string[0..idx] } + substrings(string[1..])
end

def palindromes(string)
  substrings(string).filter { |e| e == e.reverse && e.size > 1 }
end

# Further Exploration
# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case? Alphanumeric characters are alphabetic
# characters(upper and lowercase) and digits.

=begin
algorithm changes:
compare the substring against its reverse with both in lowercase or using
  casecmp
also, remove all nonalphanumeric characters using String#gsub
=end

def palindromes2(string)
  string = string.downcase.gsub(/[^A-Za-z0-9]/, '')
  palindromes(string)
end
