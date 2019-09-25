# Short Long Short
# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

# Examples:

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# input: 2 string parameters.
# output: shorter string + longer string + shorter string

# algorithm: Determine which string is longer using #length. Concatenate and
# return short + long + short

def short_long_short(s1, s2)
  if s1.length > s2.length
    longer = s1
    shorter = s2
  else
    longer = s2
    shorter = s1
  end
  shorter + longer + shorter
end
