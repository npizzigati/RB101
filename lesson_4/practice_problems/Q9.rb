# Practice Problem 9
# What is the return value of map in the following code? Why?

# { a: 'ant', b: 'bear' }.map do |key, value|
#   if value.size > 3
#     value
#   end
# end

# Answer: ['bear']
# It's 'bear' because that's the only value with size > 3, and it's an array
# because that's what map returns

# OH SURPRISE
# The real return value is [nil, 'bear']; the first value is nil because
# that's what a if statement that evaluates to false returns
