# Practice Problem 8
# What happens when we modify an array while we are iterating over it? What
# would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# What would be output by this code?
# I'm predicting it won't work as intended, but I'm not sure what it will do.
# Results:
# It prints
# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# Again, I'm pretty sure the result will be somewhat unexpected
# Results:
# It prints:
# 1
# 2
