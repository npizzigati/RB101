# Sum of Digits
# Write a method that takes one argument, a positive integer, and returns the
# sum of its digits.

# Examples:

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45
# The tests above should print true.

# For a challenge, try writing this without any basic looping constructs
# (while, until, loop, and each).

# inputs: a single positive integer
# outputs: sum of digits

# test cases: see above
# DS and A: Convert number to string and then to an array. Loop through the
# array. At each digit, convert it to an integer and add it to the sum. Return
# sum. 

def sum(user_int)
  sum = 0
  user_int.to_s.chars.each do |digit|
    sum += digit.to_i
  end
  sum
end

# without looping constructs

def sum2(user_int)
  digit_array = user_int.to_s.chars.map { |digit| digit.to_i}
  digit_array.sum
end
