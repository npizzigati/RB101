# Multiplicative Average
# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# Examples:

# show_multiplicative_average([3, 5])
# The result is 7.500

# show_multiplicative_average([6])
# The result is 6.000

# show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667

=begin

input: array of integers
output: multiplicative average rounding to 3 decimal places

rules:
explicit:
assume array is non-empty
implicit:
Results should be printed like: 'The result is [result]'

algorithm
use inject to multiply numbers and then divide by Array#size. Finally round
using Array#round to 3 decimal places.
=end

def show_multiplicative_average(array)
  res = (array.inject(&:*).to_f / array.size).round(3)
  format('The result is %.3f', res)
end
