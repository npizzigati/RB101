require 'minitest/autorun'
require_relative '../swap_case.rb'

class SwapCaseTest < Minitest::Test
  def test_swapcase
    assert_equal('cAMELcASE', swapcase('CamelCase'))
    assert_equal('tONIGHT ON xyz-tv', swapcase('Tonight on XYZ-TV'))
  end

  def test_swapcase2
    assert_equal('cAMELcASE', swapcase2('CamelCase'))
    assert_equal('tONIGHT ON xyz-tv', swapcase2('Tonight on XYZ-TV'))
  end
end
