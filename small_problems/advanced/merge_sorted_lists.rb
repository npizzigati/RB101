# Merge Sorted Lists
# Write a method that takes two sorted Arrays as arguments, and returns
# a new Array that contains all elements from both arguments in sorted
# order.

# You may not provide any solution that requires you to sort the result
# array. You must build the result array one element at a time in the
# proper order.

# Your solution should not mutate the input arrays.

# Examples:

# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# problem decomposition
# input: 2 arrays
# output: array

# rules:
# explicit:
# input arrays are both sorted
# output array will contain all elements from both arrays in sorted order
# may not sort result array -- must build it one element at a time in proper
# order
# may not mutate input arrays
# implicit:
# order is ascending
# preserve repeat elements
# if one array is blank, the result is simply the other array
# input arrays may be of different lengths

# algorithm and data structures
# if one array is blank, return the other one
# initialize empty result array
# iterate over first array
# for each member, iterate over other array and compare elements against 1st one
#   - if less than, insert that element and then member into results array, else vice versa

# code
def merge(arr1, arr2)
  return arr1 + arr2 if (arr1.empty? || arr2.empty?)
  result = []
  arr1.each do |e| 
    idx = 0
    while idx < arr2.size 
      if arr2[idx] < e
        lower_value = arr2.delete_at(idx) 
        result << lower_value 
        idx -= 1
      end
      idx += 1
    end
    result << e
  end
  result = result + arr2
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
