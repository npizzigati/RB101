# Lettercase Counter
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# Examples

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
input: 1 string
output: a 3-entry hash; lowercase: [num of lc let], uppercase: [num]
                        neither: [num]
rules
explicit:
see input and output
implicit:
NA

algorithm
initialize letters hash with a default value of 0 for each element
iterate through string.chars using each
  case statement
  when let is upper (use regex)
    letters[uppercase] += 1
  when let is lower
    letters[lowercase] += 1
  else
    letters[neither] += 1
return letters
=end

def letter_case_count(string)
  letters = { lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    case char
    when /[A-Z]/
      letters[:uppercase] += 1
    when /[a-z]/
      letters[:lowercase] += 1
    else
      letters[:neither] += 1
    end
  end
  letters
end
