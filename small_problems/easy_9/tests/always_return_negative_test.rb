require 'minitest/autorun'
require_relative '../always_return_negative.rb'

class ReturnNegativeTest < Minitest::Test
  def test_negative
    assert_equal(-5, negative(5))
    assert_equal(-3, negative(-3))
    assert_equal(0, negative(0))
  end
end
