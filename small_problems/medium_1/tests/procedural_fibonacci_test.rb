require 'minitest/autorun'
require_relative '../procedural_fibonacci.rb'

class ProceduralFibonacciTest < Minitest::Test
  def test_fibonacci_of_3
    expected = 2
    actual = fib(3)
    assert_equal(expected, actual)
  end

  def test_other_cases
    assert_equal(1, fib(1))
    assert_equal(1, fib(2))
    assert_equal(3, fib(4))
    assert_equal(5, fib(5))
    assert_equal(144, fib(12))
    assert_equal(6765, fib(20))
  end
end
