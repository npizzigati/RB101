# Palindromic Numbers
# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

# Examples:

# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# inputs: an integer
# outputs: true if integer is palindromic, false otherwise
# algorithm: convert to string and then compare string against string.reverse

def palindromic_number?(user_int)
  string = user_int.to_s

  string == string.reverse
end

# Further Exploration
# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?

# inputs: an integer beginning with one or more zeros
# outputs: true if integer is palindromic (including zeros), false otherwise

# Integer will have zeros automatically removed... not sure how to remedy this.
