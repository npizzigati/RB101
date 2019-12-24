# Lettercase Percentage Ratio
# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

# Examples

# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

=begin
problem
*******
input: string
output: hash with three entries

rules
*****
explicit: - input string will contain at least one letter, and may contain any
            characters
          - output hash will contain three percentages: lowercase, uppercase,
            neither
implicit: - spaces are counted as characters
          - return value hash keys should be ':lowercase', ':uppercase' and ':neither'

examples/text cases: see problem definition

data structures and algorithm
*****************************
Convert input string into array using #chars. Find the number of uppercase and
lowercase characters by testing whether each character is equal to the same
character converted with the #upcase/#downcase method. Other characters can be
found by subtracting the total of upper and lowercase characters from the total
length of the string.

=end

def letter_numbers(string)
  numbers = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |letter|
    if letter.ord.between?(65, 90)
      numbers[:uppercase] += 1
    elsif letter.ord.between?(97, 122)
      numbers[:lowercase] += 1
    else
      numbers[:neither] += 1
    end
  end
  numbers
end

def letter_percentages(string)
  calculate_percentages(letter_numbers(string), string.size)
end

def calculate_percentages(numbers, total)
  numbers.inject({}) do |accum, (k, v)|
    accum.update({ k => (v.to_f / total * 100).round(2) })
  end
end
