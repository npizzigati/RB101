=begin
Delete vowels
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

***
input: array of strings
output: same array, but with vowels removed
--rules--
-explicit
-- NA
-implicit
-- case insensitve (but all output in original case)
-- if only vowels present, returns empty string

ALGORITHM
iterate through array using each
at each iteration
  remove vowels from string using String#delete
DATA STRUCTURES: arrays
=end

def remove_vowels(ary)
  new_ary = []
  ary.each() { |string| new_ary << string.delete('aeiouAEIOU')}
  new_ary
end
