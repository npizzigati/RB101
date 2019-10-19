# Get The Middle Character
# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

# Examples:

# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'

# input: a string
# output: the middle char or chars of that string
# rules: explicit: if arg string has odd length, one middle char; if even, two
#                  arg string will be non-empty
#        implicit: spaces count as characters
#                  if arg string is single char, return that char

# algorithm:
=begin
determine length of string; if odd, extract the char at index length / 2 + 1
if even, extract chars at indexes length/2 and length/2 - 1
=end

def center_of(string)
  len = string.size
  half = len / 2
  if len.odd?
    string[half]
  else
    string[half - 1] + string[half]
  end
end
