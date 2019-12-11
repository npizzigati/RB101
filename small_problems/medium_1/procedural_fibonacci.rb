# Fibonacci Numbers (Procedural) In the previous exercise, we developed a
# recursive solution to calculating the nth Fibonacci number. In a language that
# is not optimized for recursion, some (not all) recursive methods can be
# extremely slow and require massive quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed
# for heavy recursion; as a result, the Fibonacci solution is only useful up to
# about fibonacci(40). With higher values of nth, the recursive solution is
# impractical. (Our tail recursive solution did much better, but even that
# failed at around fibonacci(8200).)

# Fortunately, every recursive method can be rewritten as a non-recursive
# (procedural) method.

# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

# Examples:

# fibonacci(20) == 6765 fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

=begin
input: nth number desired of fibonacci sequence.
output: the fibonacci number corresponding to the input nth number.
algorithm:
1. create series
initialize arr [1, 1]
loop while n < 2
  n -= 1
  arr << arr[-1] + arr[-2]
=end

def fib(num)
  arr = [1, 1]
  while num > 2
    num -= 1
    arr << (arr[-1] + arr[-2])
    arr.shift
  end
  arr.last
end
