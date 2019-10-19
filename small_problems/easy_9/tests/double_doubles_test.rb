require 'minitest/autorun'
require_relative '../double_doubles.rb'

class DoubleDoublesTest < Minitest::Test
  def test_twice
    assert_equal(74, twice(37))
    assert_equal(44, twice(44))
    assert_equal(668866, twice(334433))
    assert_equal(888, twice(444))
    assert_equal(214, twice(107))
    assert_equal(103103, twice(103103))
    assert_equal(3333, twice(3333))
    assert_equal(7676, twice(7676))
    assert_equal(123_456_789_123_456_789,
                 twice(123_456_789_123_456_789))
    assert_equal(10, twice(5))
  end
end
