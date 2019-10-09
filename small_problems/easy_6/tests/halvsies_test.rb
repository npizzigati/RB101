require 'minitest/autorun'
require_relative '../halvsies.rb'

class HalvsiesTest < Minitest::Test
  def test_halvsies
    assert_equal([[1, 2], [3, 4]], halvsies([1, 2, 3, 4]))
    assert_equal([[1, 5, 2], [4, 3]], halvsies([1, 5, 2, 4, 3]))
    assert_equal([[5], []], halvsies([5]))
    assert_equal([[], []], halvsies([]))
  end
end
