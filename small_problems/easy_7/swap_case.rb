# Swap Case
# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=begin

input: string
output: new string with each letter's case swapped

rules
explicit:
we may not use String#swapcase
all non-letter characters should remain unchanged
implicit:
NA

algorithm
iterate through string.chars using map
  if char =~ /A-Z/, downcase
  if char =~ /a-z/, upcase
join and return
=end

def swapcase(string)
  mapped_ary = string.chars.map do |e|
    if e =~ /[A-Z]/
      ret = e.downcase
    elsif e =~ /[a-z]/
      ret = e.upcase
    else
      ret = e
    end
    ret
  end
  mapped_ary.join
end

# algorithm 2, using gsub

def swapcase2(string)
  string.gsub(/[A-Za-z]/) { |m| ((63..90).cover?(m.ord)) ? m.downcase : m.upcase }
end
