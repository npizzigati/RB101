require 'minitest/autorun'
require_relative '../rotation_part3.rb'

class RotationPart3Test < Minitest::Test
  def test_rotate
    arr = 123456.to_s.chars
    expected = %w(2 3 4 5 6 1)
    actual = rotate(arr)
    assert_equal(expected, actual)
  end

  def test_max_rotation
    assert_equal(321579, max_rotation(735291))
    assert_equal(3, max_rotation(3))
    assert_equal(53, max_rotation(35))
    assert_equal(15, max_rotation(105))
    assert_equal(7_321_609_845, max_rotation(8_703_529_146))
  end

  def test_multiple_consecutive_zeros
    assert_equal(301079, max_rotation(730091))
  end
end
