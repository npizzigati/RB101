        # Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

# Examples

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# Problem
=begin
input: array
output: array

rules: to rotate array, each row from bottom to top will become each new column.

algorithm:
determine size of original array; this will be the number of rows in the new array
determine size of first element of original array; this is the number of columns in the new array

outer iteration by calling #times on num of new rows, idx r; inner iteration by calling #times on num of new 
  cols, idx c
before outer block, initialize variable for new matrix,  
at the start of each outer block, initialize variable for each new row
in each inner block, append the value at orig array[c][r] to the beggining of the
new row using #unshift.
upon exiting each inner block, push the new row onto the new matrix
return the new matrix on the last line of the function  
=end

def rotate90(matrix)
  new_matrix = []
  matrix[0].size.times do |n|
    new_row = []
    matrix.size.times do |m|
      new_row.unshift(matrix[m][n])
    end
    new_matrix << new_row
  end
  new_matrix
end
