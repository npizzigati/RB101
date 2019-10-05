# What is the return value of the select method below? Why?

# [1, 2, 3].select do |num|
#   num > 5
#   'hi'
# end

# Answer:
# [1, 2, 3] because the return value of the block 'hi' is true for each member
# of the array
