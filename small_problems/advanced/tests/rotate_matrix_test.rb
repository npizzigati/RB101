require 'minitest/autorun'
require_relative '../rotate_matrix.rb'

class RotateTest < Minitest::Test
  def test_rotate90
    matrix1 = [
      [1, 5, 8],
      [4, 7, 2],
      [3, 9, 6]
    ]
    expected = [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
    actual = rotate90(matrix1)
    assert_equal(expected, actual)
  end

  def test_rotate90_2
    matrix2 = [
      [3, 7, 4, 2],
      [5, 1, 0, 8]
    ]
    expected = [[5, 3], [1, 7], [0, 4], [8, 2]]
    actual = rotate90(matrix2)
    assert_equal(expected, actual)
  end
end
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
enne
