# Squaring an Argument
# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).

# Example:

# square(5) == 25
# square(-8) == 64

# inputs: one integer
# outputs: the square of the integer

# algorithm: Multiply the number by itself using the multiply function

def multiply(a, b)
  a * b
end

def square(a)
  multiply(a, a)
end

# further exploration
# inputs: two numbers, the first the base and the second the exponent
# outputs: base**exponent, but using the multiply method
# example cases: exponent(2, 3) = 2 * 2 * 2 = 8
# algorithm: call multiply with the first two numbers, and then call multiply
# again with the result from that call, and so on, until you've called it power
# number of times.
# alternate algorithm: expand multiplication to an array of factors, then use
# #reduce on the array to produce the exponent 

def exponent(a, b)
  arr = []
  b.times { arr << a }

  arr.reduce { |n1, n2| multiply(n1, n2)}
end
