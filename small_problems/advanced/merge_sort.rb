# Merge Sort
# Sort an array of passed in values using merge sort. You can assume
# that this array may contain only one type of data. And that data may
# be either all numbers or all strings.

# Merge sort is a recursive sorting algorithm that works by breaking
# down the array elements into nested sub-arrays, then recombining those
# nested sub-arrays in sorted order. It is best shown by example. For
# instance, let's merge sort the array [9,5,7,1]. Breaking this down
# into nested sub-arrays, we get:

# [9, 5, 7, 1] ->
# [[9, 5], [7, 1]] ->
# [[[9], [5]], [[7], [1]]]
# We then work our way back to a flat array by merging each pair of
# nested sub-arrays:

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] ->
# [1, 5, 7, 9]
# Examples:

def merge(arr1, arr2)
  return arr1 + arr2 if arr1.empty? || arr2.empty?
  res = []
  arr2_idx = 0
  arr1.each do |e| 
    while arr2_idx < arr2.size && arr2[arr2_idx] < e
      res << arr2[arr2_idx]
      arr2_idx += 1
    end
  res << e
  end
  res.concat(arr2[arr2_idx..-1])
end

def merge_sort(arr)
  arr_size = arr.size
  if arr_size < 2
    return arr
  end
  merge(merge_sort(arr[0..(arr_size / 2 - 1)]),
        merge_sort(arr[(arr_size / 2)..-1]))
end

puts ''


puts ''
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
