# Next Featured Number Higher than a Given Value
# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
# multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Issue an error message
# if there is no next featured number.

# Examples:

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those
# requirements

=begin
problem
*******
input: a single integer
output: next featured number

rules
-----
explicit: featured numbers must:
          - be divisible by seven
          - be odd
          - have each digit occurring only once
implicit: If there is no possible number, the error message should be as
          indicated in the instructions
          There are no featured numbers after 9_999_999_999
   questions: input validation?

algorithm and data structures
*****************************
Find first number divisible by 7 over input num. Check whether odd and whether
each digit occurs only once. To check whether digits occur only once, use
#digits and #uniq. If num doesn't meet conditions, add 7 and check again. If
number is greater than or equal to 9_999_999_999 return no possible number
message.
=end

def find_next_multiple(number)
  loop do
    number += 1
    return number if number % 7 == 0
  end
end

def meets_other_conditions?(number)
  number.odd? && number.digits.uniq == number.digits
end

def featured(number)
  multiple = find_next_multiple(number)
  while multiple < 9876543210
    return multiple if meets_other_conditions?(multiple)

    multiple += 7
  end
  raise 'There is no possible number that fulfills those requirements'
end
