require 'minitest/autorun'
require_relative '../fibonacci_last_digit.rb'

class FibLastDigitTest < Minitest::Test
  def test_100th_fibonacci_number
    expected = 5
    actual = fib_last_digit(100)
    assert_equal(expected, actual)
  end

  def test_123456789
    expected = 4
    actual = fib_last_digit(123456789)
    assert_equal(expected, actual)
  end

  def test_fib_15
    expected = 610
    actual = fib(15)
    assert_equal(expected, actual)
  end

  def test_fib_20
    expected = 6765
    actual = fib(20)
    assert_equal(expected, actual)
  end

  def test_calculate_first_sequence_of_60_produces_a_list_with_60_members
    expected = 60
    actual = calculate_first_sequence_of_60.length
    assert_equal(expected, actual)
  end

  def test_calculate_first_sequence_of_60_1st_10_members_correct
    expected = [1, 1, 2, 3, 5, 8, 3, 1, 4, 5]
    actual = calculate_first_sequence_of_60.slice(0..9)
    assert_equal(expected, actual)
  end
end
