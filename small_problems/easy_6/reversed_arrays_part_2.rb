=begin
Reversed Arrays (Part 2)
Write a method that takes an Array, and returns a new Array with the elements
of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

input: array
output: new array with elements in reverse order
RULES
explicit:
do not modify original list
may not use Array#reverse or Array#reverse! or method from previous exercise
implicit:
NA

ALGORITHM
use each_with_object to create new array
add elements to new array by unshifting each element from old array to new

DATA STRUCTURES: array
=end

# def reverse(ary)
#   ary.each_with_object([]) { |e, new_ary| new_ary.unshift(e)}
# end

# Further Exploration
# An even shorter solution is possible by using either inject or
# each_with_object. Just for fun, read about these methods in the Enumerable
# module documentation, and try using one in your reverse method.

# ALGORITHM: same as for each_with_object -- unshift elements from array onto
# accum
def reverse(ary)
  ary.inject([]) { |accum, e| accum.unshift(e)}
end
