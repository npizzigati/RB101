# Uppercase Check
# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

# Examples:

# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true

=begin
input: string
output: boolean
rules:
explicit:
return true if all alphabetic characters inside string are uppercase, false otherwise
non-letters should be ignored
implicit: empty string is true

algorithm:
convert string to array and use Array#all? with a block
block should check that each char == the uppercase version of that char
=end

def uppercase?(string)
  string.chars.all? { |char| char == char.upcase }
end
