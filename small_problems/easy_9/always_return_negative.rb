# Always Return Negative
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0 or
# negative, return the original number.

# Examples;

# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby

=begin
input: a number
output: a number
rules:
explicit:
if input number is positive return the negative of that number
If input number is negative or zero, return that number
implicit:
input will always be an integer
algorithm:
return -num if num > 0
return num
=end

def negative(num)
  return -num if num > 0
  return num
end
