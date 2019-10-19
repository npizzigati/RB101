require 'minitest/autorun'
require_relative '../reverse_number.rb'

class ReverseNumberTest < Minitest::Test
  def test_reversed_number
    assert_equal(54321, reversed_number(12345))
    assert_equal(31221, reversed_number(12213))
    assert_equal(654, reversed_number(456))
    assert_equal(21, reversed_number(12000))
    assert_equal(30021, reversed_number(12003))
    assert_equal(1, reversed_number(1))
  end
end
