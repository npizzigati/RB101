require 'minitest/autorun'
require_relative '../sum_of_sums.rb'

class SumOfSumsTest < Minitest::Test
  def test_sum_of_sums
    assert_equal(21, sum_of_sums([3, 5, 2]))
    assert_equal(36, sum_of_sums([1, 5, 7, 3]))
    assert_equal(4, sum_of_sums([4]))
    assert_equal(35, sum_of_sums([1, 2, 3, 4, 5]))
  end
end


