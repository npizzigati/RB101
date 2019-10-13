# Staggered Caps (Part 1)
# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.

# Example:

# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin

input: string
output: string converted to staggered caps (every other character capitalized)

rules
explicit:
non-letter characters remain unchanged, but count in terms of the cap switching
implicit:
first letter is capitalized

algorithm
initialize empty staggered_chars array
iterate through string.chars using each_with_index
  if index is even upcase the letter (with :ascii option)
  else downcase the letter (also with :ascii option)
join and return string

=end

def staggered_case(string)
  staggered_chars = []
  string.chars.each_with_index do |char, idx|
    if idx.even?
      staggered_chars << char.upcase(:ascii)
    else
      staggered_chars << char.downcase(:ascii)
    end
  end
  staggered_chars.join
end

# Further Exploration
# Can you modify this method so the caller can request that the first character
# be downcased rather than upcased? If the first character is downcased, then
# the second character should be upcased, and so on.

# Hint: Use a keyword argument.


def staggered_case2(string, start:)
  staggered_chars = []
  string.chars.each_with_index do |char, idx|
    idx += 1 if start == :lower
    if idx.even?
      staggered_chars << char.upcase(:ascii)
    else
      staggered_chars << char.downcase(:ascii)
    end
  end
  staggered_chars.join
end
