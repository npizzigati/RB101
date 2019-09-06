# Odd
# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute value is
# odd. You may assume that the argument is a valid integer value.
# 
# Examples:
# 
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true
#
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# PEDAC
# inputs: any integer, positive, negative or zero
# output: boolean true if numbers absolute value is odd, false if not

# Questions: Input validation? 

# Example cases: see above

# Data Structures and Algorithms
# Validate that number is an integer and print message if not and return
# nothing. If the modulo by 2 of the number is 1, return true. If not, return false. 

def is_odd?(num)
    return 'Number parameter must be an integer' unless num.is_a?(Integer)
    num.abs % 2 == 1
end

