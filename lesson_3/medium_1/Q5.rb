# Question 5
# Alyssa asked Ben to write up a basic implementation of a Fibonacci
# calculator, A user passes in two numbers, and the calculator will keep
# computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he
# got an error. Something about the limit variable. What's wrong with the code?

## set limit to 15
# limit = 15

## accept two parameters that are numbers
# def fib(first_num, second_num)
#   # Do until first num + second num = limit
#   while first_num + second_num < limit
#     # set sum equal to first plus second num
#     sum = first_num + second_num
#     # set first num equal to second num
#     first_num = second_num
#     # set second_num equal to sum
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1)
# puts "result is #{result}"

# Answer:
# The limit variable is neither passed in nor initialized to a value anywhere
# in the function, and the function can't access the local variable outside its
# scope.

# To make it work, you would have to pass the limit variable in as an argument
# first num / second num / sum
