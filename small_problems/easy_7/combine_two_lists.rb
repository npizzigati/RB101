# Combine Two Lists
# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# Example:

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin

input: 2 arrays
output: new array with the elements alternating the elements in each of the
argument arrays

rules
explicit:
assume both input arrays are non-empty and have same number of arguments
implicit:
NA

ALGORITHM: Loop
initialize new_array = []
set cnt = 0
loop
  push idx cnt value of each arg array onto new array
  add 1 to cnt
return new array

ALGORITHM: Inject

=end

def interleave(ary1, ary2)
  new_array = []
  cnt = 0
  while cnt < ary1.size
    new_array << ary1[cnt]
    new_array << ary2[cnt]
    cnt += 1
  end
  new_array
end

def interleave2(ary1, ary2)
  ary1.inject(ary2) do |accum, e|
    insert_idx = (accum.size - ary1.size) * 2
    accum.insert(insert_idx, e)
  end
end

# Further Exploration
# Take a few minutes to read about Array#zip. #zip doesn't do the same thing as
# interleave, but it is very close, and more flexible. In fact, interleave can
# be implemented in terms of zip and one other method from the Array class. See
# if you can rewrite interleave to use zip.

def interleave_with_zip(ary1, ary2)
  ary1.zip(ary2).flatten
end
