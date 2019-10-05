# What is the return value of the following code? Why?

# [1, 2, 3].map do |num|
#   if num > 1
#     puts num
#   else
#     num
#   end
# end

# Answer: the return value is [1, nil, nil] since the return value of puts is
# nil
