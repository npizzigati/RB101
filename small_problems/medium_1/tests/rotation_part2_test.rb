require 'minitest/autorun'
require_relative '../rotation_part2.rb'

class RotationP2Test < Minitest::Test
  def test_rotate_rightmost_digits
    assert_equal(735291, rotate_rightmost_digits(735291, 1))
    assert_equal(735219, rotate_rightmost_digits(735291, 2))
    assert_equal(735912, rotate_rightmost_digits(735291, 3))
    assert_equal(732915, rotate_rightmost_digits(735291, 4))
    assert_equal(752913, rotate_rightmost_digits(735291, 5))
    assert_equal(352917, rotate_rightmost_digits(735291, 6))
  end
end
