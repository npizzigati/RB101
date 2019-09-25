# Question 3
# Alan wrote the following method, which was intended to show all of the
# factors of the input number:

# def factors(number)
#   divisor = number  # Set divisor equal to arg number
#   factors = []  # initialize an empty array for factors
#   begin
      # add number / divisor on to end of factors array if number is evenly
      # divisible by divisor
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
    # will end when divisor == 0, so loop will run and divide by zero
#   end until divisor == 0
    # returns factors
#   factors
# end
# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using
# begin/end/until? Note that we're not looking to find the factors for 0 or
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

# Solution
# See comments made to above code in order to understand it.

# Sample run, number = 15
# divisor set to 15
# factors initialized to []
# 1st iteration of loop:
#   number (15) / divisor (15) = 1
#   factors << 1
# 2nd iteration of loop:
#   number (15) / divisor (14) = not evenly divisable
# 3rd iteration of loop:
#   number (15) / divisor (13) = not evenly divisable
# etc...
# 11th iteration of loop:
#   number (15) / divisor (5) = 3
#   factors << 3
# etc...
# 13th iteration of loop:
#   number (15) / divisor (3) = 5
#   factors << 5
# etc...
# 15th iteration:
#   number (15) / divisor (1) = 15
#   factors << 15
# 16th iteration:
#   number (15) / divisor (0) = ERROR

# To fix problem change end line to: end until divisor == 0
def factors(number)
  divisor = number  # Set divisor equal to arg number
  factors = []  # initialize an empty array for factors
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 1
  factors
end
