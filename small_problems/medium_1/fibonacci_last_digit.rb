# Fibonacci Numbers (Last Digit) In the previous exercise, we developed a
# procedural method for computing the value of the nth Fibonacci numbers. This
# method was really fast, computing the 20899 digit 100,001st Fibonacci sequence
# almost instantly.

# In this exercise, you are going to compute a method that returns the last
# digit of the nth Fibonacci number.

# Examples:

# fibonacci_last(15) # -> 0 (the 15th Fibonacci number is 610)
# fibonacci_last(20) # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100) # -> 5 (the 100th Fibonacci number is
# 354224848179261915075) fibonacci_last(100_001) # -> 1 (this is a 20899 digit
# number) fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

=begin
input: An integer n
output: The last digit of the nth number of the fibonacci sequence
rules:
explicit: see input and output
implicit: must handle n input numbers up to 1e8
algorithm:
Calculate the last digits of the first 60 fibonacci numbers (use recursion with
memoization). To obtain subsequent last digits, take the mod 60 of n (last digit
sequence repeats every 60 digits).
=end


def fib(num, memo=Hash.new)
  if num < 3
    1
  elsif memo[num]
    memo[num]
  else
    memo[num] = fib((num - 1), memo) + fib((num - 2), memo)
  end
end

def fib_last_digit(num)
  first_60 = calculate_first_sequence_of_60
  idx = num % 60
  first_60[idx - 1]
end

def calculate_first_sequence_of_60
  last_digits = []
  (1..60).each do |num|
    last_digits << fib(num).digits.reverse.last
  end
  last_digits
end
