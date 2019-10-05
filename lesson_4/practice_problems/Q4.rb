# Practice Problem 4
# What is the return value of each_with_object in the following code? Why?

# ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
#   hash[value[0]] = value
# end

# Answer: { 'ant' => 'cat' }
# OOPS
# The real answer is:
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
# DOH!
