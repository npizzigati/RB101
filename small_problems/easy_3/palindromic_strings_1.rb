# Palindromic Strings (Part 1)
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

# inputs: string
# outputs: true if string is a palindrome, false if not
# algorithm: Set result to true. Iterate through string by chaining #chars and
# #each_index. At each index, check whether string[idx] ==
# string[string.length - idx )]. If false, set result flag to false. Also
# break if idx == string.length / 2

def palindrome?(string)
  result = true
  max_idx = string.length - 1
  string.chars.each_index do |idx|
    break if idx == max_idx / 2
    if string[idx] != string[max_idx - idx]
      result = false
      break
    end
  end
  result
end

# A much simpler way: simply check if string == string.reverse
