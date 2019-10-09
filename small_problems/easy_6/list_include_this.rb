# Does My List Include This?
# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the
# array, false if it is not. You may not use the Array#include? method in your
# solution.

# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

=begin
input: array, search value
output: true or false, depending on whether value is in array

rules
explicit:
Array#include? method may not be used
implicit:
If nil is contained in array, a search value of nil should return true
A search value of nil should return false for an empty array

algorithm
use the Enumerable#find method with a block that returns true if e == search value
-this may not work for nil test case... will revise algorithm in that case
=end

def include?(ary, val)
  return true if ary == [nil] and val == nil
  true & ary.find { |e| e == val }
end
