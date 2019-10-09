require 'minitest/autorun'
require_relative '../fibonacci.rb'

class TestFibonacci < Minitest::Test
  def test_fibonacci_index_by_length
    assert_equal(7, find_fibonacci_index_by_length(2))
    assert_equal(12, find_fibonacci_index_by_length(3))
    assert_equal(45, find_fibonacci_index_by_length(10))
    assert_equal(476, find_fibonacci_index_by_length(100))
    assert_equal(4782, find_fibonacci_index_by_length(1000))
    assert_equal(47847, find_fibonacci_index_by_length(10000))
  end
end
