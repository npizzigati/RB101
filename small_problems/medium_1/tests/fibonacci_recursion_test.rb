require 'minitest/autorun'
require_relative '../fibonacci_recursion.rb'

class FibonacciTest < Minitest::Test
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

class MemoizedFibonacciTest < Minitest::Test
  def test_fibonacci_of_3
    expected = 2
    actual = mfib(3)
    assert_equal(expected, actual)
  end

  def test_other_cases
    assert_equal(1, mfib(1))
    assert_equal(1, mfib(2))
    assert_equal(3, mfib(4))
    assert_equal(5, mfib(5))
    assert_equal(144, mfib(12))
    assert_equal(6765, mfib(20))
  end
end

class TailCallFibonacciTest < Minitest::Test
  def test_fibonacci_of_3
    expected = 2
    actual = tfib(3)
    assert_equal(expected, actual)
  end

  def test_other_cases
    assert_equal(1, tfib(1))
    assert_equal(1, tfib(2))
    assert_equal(3, tfib(4))
    assert_equal(5, tfib(5))
    assert_equal(144, tfib(12))
    assert_equal(6765, tfib(20))
  end
end
