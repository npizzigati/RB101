# Further Exploration
# Write a transpose! method that transposes a matrix in place. The obvious
# solution is to reuse transpose from above, then copy the results back into the
# array specified by the argument. For this method, don't use this approach; write
# a method from scratch that does the in-place transpose.

# Solution process
=begin

input: array
output: array

rules: 
explicit: method must mutate input array

algorithm and data structures:
Create an outer loop to iterate over rows and an inner loop to iterate over columns.
At each pair of indices, swap the value at row and column r, c with the value at row and column c, r.
Must keep track of swaps: append each swap to a array and check each new swap against this array before
doing swap.
=end

def transpose(matrix)
  rows = matrix.size
  cols = matrix[0].size
  done = []
  rows.times do |r| 
    cols.times do |c| 
      pair = [matrix[r][c], matrix[c][r]].sort
      if !done.include?(pair)
        matrix[r][c], matrix[c][r] = matrix[c][r], matrix[r][c]
        done << pair
      end
    end
  end
  matrix                        # 
end

