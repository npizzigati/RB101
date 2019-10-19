# Leading Substrings
# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.

# Examples:

# substrings_at_start('abc') == ['a', 'ab', 'abc']
# substrings_at_start('a') == ['a']
# substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

=begin

input: a string.
output: an array of leading substrings of the input string.

rules:
explicit:
output should be ordered from shortest to longest substring
implicit:
NA

algorithm:
initialize empty leading_strings array
use inject to concatenate each letter in the string in turn
  at each interation, add the current accum value to the leading_strings array;
return leading_strings array

simpler algorithm:
initialize leading strings array to empty string;
do x number of times where x is string size:
  push substring onto array where substring equals the range (0..loop idx)
return leading strings array

=end

def substrings_at_start(string)
  leading_strings = []
  string.size.times do |idx|
    leading_strings << string[0..idx]
  end
  leading_strings
end
