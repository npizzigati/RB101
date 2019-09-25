# Palindromic Strings (Part 2)
# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If
# you wish, you may simplify things by calling the palindrome? method you wrote
# in the previous exercise.

# Examples:

# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false

# inputs: string
# outputs: true if string is a palindrome, false if not
# algorithm: Set result to true. Iterate through string by chaining #chars and
# #each_index. At each index, check whether string[idx] ==
# string[string.length - idx )]. If false, set result flag to false. Also
# break if idx == string.length / 2

def real_palindrome?(string)
  string = string.downcase.gsub(/[^a-z0-9]/, '')
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
def real_palindrome2?(string)
  string = string.downcase.gsub(/[^a-z0-9]/, '')
  string == string.reverse
end
