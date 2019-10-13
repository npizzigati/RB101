require 'minitest/autorun'
require_relative '../multiplicative_average.rb'

class MultiplicativeAverageTest < Minitest::Test
  def test_multiplicative_average
    assert_equal('The result is 7.500',
                 show_multiplicative_average([3, 5]))
    assert_equal('The result is 6.000',
                 show_multiplicative_average([6]))
    assert_equal('The result is 28361.667',
                 show_multiplicative_average([2, 5, 7, 11, 13, 17]))
  end
end

