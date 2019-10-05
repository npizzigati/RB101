# Multiples of 3 and 5
# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 +
# 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# input: an integer x
# output: the sum of all multiples of 3 and 5 between 1 and x (inclusive)

# algorithm: use range with #step to create array of multiples. Then reduce array to produce sum

def multisum(num)
  (0..num).select { |e| (e % 3 == 0) || (e % 5 == 0) }.sum
end



puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
