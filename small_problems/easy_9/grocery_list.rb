# Grocery List
# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

# Example:

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

=begin
input: array (grocery list of fruits with quantities)
output: array of fruits spelled out however many times present

rules:
explicit: see input and output
implicit: input array is a nested array as follows:
  [[fruit, num], [fruit2, num], ...]
algorithm:
using inject, starting with an empty array, create a new array and add it on to
the existing array for each subarray. The new array should have a length equal
to the fruit number and the block should consist only of the name of the fruit
=end

def buy_fruit(list)
  list.inject([]) { |accum, subarr| accum + Array.new(subarr[1]) { subarr[0] } }
end
