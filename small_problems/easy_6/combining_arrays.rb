=begin
Combining Arrays
Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in
the original Arrays.

Example

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

input: 2 arrays
output: 1 array with all arguments from two argument arrays with no dup values

rules...
explicit:
Even if there are dups in the original arrays, there should be no dups in the output array
implicit:
NA

algorithm and data structures:
add arrays together
return new array with no dups using each with object
=end

def merge(ary1, ary2)
  combined = ary1 + ary2
  combined.each_with_object([]) { |e, ary| ary << e if !ary.include?(e) }
end
