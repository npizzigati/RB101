require 'minitest/autorun'
require_relative '../rotation_part1.rb'

class RotationTest < Minitest::Test
  def test_rotate_array
    assert_equal([3, 5, 2, 9, 1, 7], rotate_array([7, 3, 5, 2, 9, 1]))
    assert_equal(['b', 'c', 'a'], rotate_array(['a', 'b', 'c']))
    assert_equal(['a'], rotate_array(['a']))
  end

  def test_do_not_modify_original
    x = [1, 2, 3, 4]
    assert_equal([2, 3, 4, 1], rotate_array(x))
    assert_equal([1, 2, 3, 4], x)
  end
end
