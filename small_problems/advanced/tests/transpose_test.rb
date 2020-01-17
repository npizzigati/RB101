require 'minitest/autorun'
require_relative '../transpose.rb'

class TransposeTest < Minitest::Test
  def test_transpose
    matrix = [
      [1, 5, 8],
      [4, 7, 2],
      [3, 9, 6]
    ]
    actual = transpose(matrix)
    expected = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
    assert_equal(expected, actual)
  end

  def test_original_matrix_unchanged
    matrix = [
      [1, 5, 8],
      [4, 7, 2],
      [3, 9, 6]
    ]
    transpose(matrix)
    expected = true
    actual = matrix == [
                        [1, 5, 8],
                        [4, 7, 2],
                        [3, 9, 6]
    ]
    assert_equal(expected, actual)
  end
end
