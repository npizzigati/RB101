# Repeat Yourself
# Write a method that takes two arguments, a string and a positive integer, and
# prints the string as many times as the integer indicates.
# 
# Example:
# 
# repeat('Hello', 3)
# Output:
# 
# Hello
# Hello
# Hello

# PEDAC

# Problem:
# Inputs: 1 string, 1 positive integer
# Outputs: The original string 3 times, with a newline character between each time 
# Questions: 
# What happens when zero is entered? I will assume that nothing is printed and
# there is no error.
# What happens if a negative number is entered? I will assume that a message 
# will be printed saying that number must be positive. 
# What happens if an input type other than a string is entered? I will assume
# that an error message will be printed.

# Examples / Test Cases:
# repeat('Hello', 3) -> 'Hello\nHello\nHello\n' 
# repeat('Hello', 5) -> 'Hello\nHello\nHello\nHello\nHello\n'
# Edge cases:
# ('Hello', 0) -> ''
# ('Hello', 1) -> 'Hello\n'
# ('Hello', -1) -> 'You must supply a string and an integer'

# Data Structures / Algorithms:
# Validate parameters: if they are not a valid string and a
# positive number x, print an error message. Otherwise, print string x times.  

def repeat_yourself(user_str, num)
  if user_str.is_a?(String) && num.is_a?(Integer) && num >= 0 
    num.times { puts user_str } 
  else
    puts 'You must supply a string and a positive integer' 
  end
end
