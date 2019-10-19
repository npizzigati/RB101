# Double Char (Part 1)
# Write a method that takes a string, and returns a new string in which every
# character is doubled.

# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

=begin
input: a string
output: a new string, doubling each character
rules:
explicit:
NA
implicit:
an empty string for input will produce an empty string for output

algorithm:
convert string into array using chars
map chars; block: e * 2
join result
=end

def repeater(string)
  string.chars.map { |l| l * 2}.join
end
