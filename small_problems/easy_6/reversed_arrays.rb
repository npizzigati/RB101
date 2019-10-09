=begin
Reversed Arrays (Part 1)
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

input: array
output: mutated array with elements reversed (same object)

RULES
explicit:
may not use Array#reverse or Array#reverse!
implicit:
method should return the reversed array, in addition to mutating the orig.

ALGORITHM
Iterate though array and for each index, set ary[idx] = ary[-1 - idx]
break when idx = ary.size / 2
=end

def reverse!(ary)
  idx = 0
  while idx < ary.size / 2
    ary[idx], ary[-1 - idx] = ary[-1 - idx], ary[idx]
    idx += 1
  end
  ary
end
