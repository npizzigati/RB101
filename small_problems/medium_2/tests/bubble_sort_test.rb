require 'minitest/autorun'
require_relative '../bubble_sort.rb'

class BubbleSortTest < Minitest::Test
  def test_sorts_numerical_array
    expected = [1, 2, 4, 6, 7]
    actual = bubble_sort([6, 2, 7, 1, 4])
    assert_equal(expected, actual)
  end

  def test_sorts_string_array
    expected = %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
    actual = bubble_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
    assert_equal(expected, actual)
  end
end
