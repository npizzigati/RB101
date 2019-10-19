
# All Substrings
# Write a method that returns a list of all substrings of a string. The
# returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise:

# Examples:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

=begin
input: string
output: array containing all the substrings beginning at each index of the
  string
rules
emplicit:
order list by position of first letter in substring, and from shortest to
longest for the substrings at each position
implicit: NA

algorithm:
use Array#new
recursively
end condition:
if string equals '' return []
recursive call:
  Array.new(string.size) do |idx|
    string[0..idx] + substrings(string[1...])
  end
=end

def substrings(string)
  return [] if string == ''
  Array.new(string.size) { |idx| string[0..idx] } + substrings(string[1...])
end
