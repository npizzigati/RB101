# Practice Problem 7
# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?

# [1, 2, 3].any? do |num|
#   puts num
#   num.odd?
# end

# The blocks return value is the last statement in the block. In this case, it
# is true for all three iterations of the block. The return value of any? is
# true because at least one of the iterations returns true.
# The code outputs:
# 1
# 2
# 3

# All correct except for the output, which is just: 1, since #any stops
# iterating as soon as it finds the first true value
