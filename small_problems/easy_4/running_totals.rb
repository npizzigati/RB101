# Running Totals
# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

# Examples:
# See very end

# input: array of integers
# output: array of integers
# rules:
#   explicit:
#     - output must have same number of elements as input
#     - each output number is to be the running total of the elements from
#     the original array up to and including the number at that position
#   implicit:
#     - an empty array will result in an empty array return value
# questions: validate input?
# data structure: array

# algorithm:
# initialize empty totals array
# initialize total integer to zero
# loop through original array, at each iteration:
#   add the current element to total
#   push total onto totals array
# return totals array

def running_total(arr)
  totals = []
  sum = 0
  arr.each do |num|
    sum += num
    totals << sum
  end
  totals
end

# Using each_with_object
# initialize sum to zero, pass empty array as object to #each_with_object,
# add one to sum, the push sum to array
def running_total2(arr)
  sum = 0
  totals = arr.each_with_object([]) do |num, a|
    sum += num
    a << sum
  end
  totals
end

# Using inject
def running_total3(arr)
  sum = 0
  arr.inject([]) { |accum, e| accum + [sum += e] }
end

# Using map
def running_total4(arr)
  sum = 0
  arr.map { |e| sum += e }
end


puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []
puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []
puts running_total4([2, 5, 13]) == [2, 7, 20]
puts running_total4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total4([3]) == [3]
puts running_total4([]) == []
