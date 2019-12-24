require 'minitest/autorun'
require_relative '../square.rb'

class SquareTest < Minitest::Test
  def test_square_sum
    expected = 100
    actual = square_sum(4)
    assert_equal(expected, actual)
  end

  def test_sum_squares
    expected = 30
    actual = sum_squares(4)
    assert_equal(expected, actual)
  end

  def test_termial
    expected = 10
    actual = termial(4)
    assert_equal(expected, actual)
  end

  def test_other_test_cases
    assert_equal(22, sum_square_difference(3))
    assert_equal(2640, sum_square_difference(10))
    assert_equal(0, sum_square_difference(1))
    assert_equal(25164150, sum_square_difference(100))
  end
end
