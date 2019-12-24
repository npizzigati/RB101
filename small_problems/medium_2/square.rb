# Sum Square - Square Sum
# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

# Examples:

# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

=begin

problem
*******
input: integer
output: integer

rules
-----
explicit: - Output integer is difference between square of sum of leading integers
            and sum of squares of leading integers.
implicit: - NA

data structures and algorithm
*****************************
Calculate the square of the sum, then the sum of the squares then return the
absolute value of the difference.

=end

def termial(num)
  (1..num).inject { |accum, n| accum + n }
end

def square_sum(num)
  termial(num) ** 2
end

def sum_squares(num)
  (1..num).inject { |accum, n| accum + (n ** 2) }
end

def sum_square_difference(num)
  (square_sum(num) - sum_squares(num)).abs
end
