# Practice Problem 2
# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# It counts the number of elements for which the block returns true or a truthy
# value. This is confirmed by the return value of 1 in the above method call
