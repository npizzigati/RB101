# Double Char (Part 2)
# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.

# Examples:

# double_consonants('String') == "SSttrrinngg"
# double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# double_consonants("July 4th") == "JJullyy 4tthh"
# double_consonants('') == ""

=begin
input: string
output: new string with consonants doubled
rules:
explicit: only double consonants
implicit: NA

algorithm:
convert string into array using chars method
map chars
  if char is a consonant
    double the consonant
  else
    return to same letter
join
=end

def double_consonants(string)
  string.chars.map do |c|
    if c =~ /[a-z]/i && !'iaeouIAEOU'.include?(c)
      c * 2
    else
      c
    end
  end.join
end
