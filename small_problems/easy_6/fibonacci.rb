=begin
Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number
is the sum of the two previous numbers. This series appears throughout the
natural world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. (The first
Fibonacci number has index 1.)

Examples:

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
You may assume that the argument is always greater than or equal to 2.

***
input: integer
output: integer - the first number(index) in fibon. series with the input
integer number of digits

RULES
explicit
  index starts at 1
  argument is always >= 2
implicit
  NA

ALGORITHM
*fibonacci series:
*each number adds the previous number to itself to get the next number

set series equal to an array with a single element 1
set idx equal to 0
loop
  push 1 onto series if idx is 0, else push series[idx] + series[idx - 1]
  if series[-1] equals arg
    return idx + 1
    break
DATA STRUCTURES: array for series
NEW ALGORITHM -- the above takes too long -- see bottom for solution
what's the pattern? -- use repl to find out...
From stackoverflow:
=end

# recursion with memoization:
# this is impractical for this exercise, since it seems I need to count up, not
# down
# @mem = {}
# def fibonacci(index)
#   if index < 2
#     return index
#   else
#     @mem[index] ||= fibonacci(index - 1) + fibonacci(index - 2)
#   end
# end

# Fast recursive approach from Internet search

def find_fibonacci_index_by_length(length)
  idx = 0
  loop do
    fibonacci(idx)
    break if (fibonacci(idx) / 10 ** (length - 1)).between?(1, 9)
    idx += 1
  end
  idx
end

def fibonacci(n)
  fib(n)[0]
end

def fib(n)
  if n == 0
    return [0, 1]
  end
  a, b = fib(n / 2)
  c = a * (b * 2 - a)
  d = a * a + b * b
  if n % 2 == 0
    return [c, d]
  else
    return [d, c + d]
  end
end
