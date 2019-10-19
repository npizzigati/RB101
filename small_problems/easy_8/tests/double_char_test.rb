require 'minitest/autorun'
require_relative '../double_char.rb'

class DoubleCharTest < Minitest::Test
  def test_double_char
    assert_equal('HHeelllloo', repeater('Hello'))
    assert_equal('GGoooodd  jjoobb!!', repeater('Good job!'))
    assert_equal('', repeater(''))
  end
end
