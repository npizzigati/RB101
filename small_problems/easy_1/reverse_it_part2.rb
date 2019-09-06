# Reverse It (Part 2)
# Write a method that takes one argument, a string containing one or more
# words, and returns the given string with words that contain five or more
# characters reversed. Each string will consist of only letters and spaces.
# Spaces should be included only when more than one word is present.
# 
# Examples:
# 
# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# Input: String containing one or more words, consisting of only letters and spaces.
# Output: String with words containing five or more characters reversed;
# include spaces only when more than one word present

# Test cases: above plus
# puts reverse_words('Hello  ') # => olleH  [with no spaces]

# Split string into array of words. Iterate through words and reverse each word
# if it contains 5 or more characters. 

def reverse_words(user_str)
  ary = user_str.split
  ary.each do |word|
    word.reverse! if word.length >= 5
  end
  ary.join(' ')
end
