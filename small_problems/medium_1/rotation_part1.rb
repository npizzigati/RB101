# Rotation (Part 1)
# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

=begin
input: an array
ouput: array rotated, e.g., with first element moved to the end
rules
explicit:
do not modify original array
so not use method Array#rotate
implicit: a single element array should return an identical array
algorithm:
copy the array using dup
shift the first element off and push it back on
=end

def rotate_array(arr)
  arr2 = arr.dup
  arr2 << arr2.shift
end

# Further Exploration
# Write a method that rotates a string instead of an array. Do the same thing
# for integers. You may use rotate_array from inside your new method.

# algorithm - string:
# convert string to array using chars, call rotate_array on it, then join back
# together
# algorithm - integer:
# convert to string, then to array with chars, call rotate_array, join back
# together and call to_i on it
