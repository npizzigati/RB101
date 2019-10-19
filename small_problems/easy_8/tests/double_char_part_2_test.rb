require 'minitest/autorun'
require_relative '../double_char_part_2.rb'

class DoubleChar2Test < Minitest::Test
  def test_double_consonants
    assert_equal('SSttrrinngg', double_consonants('String'))
    assert_equal('HHellllo-WWorrlldd!',
                 double_consonants('Hello-World!'))
    assert_equal('JJullyy 4tthh', double_consonants('July 4th'))
    assert_equal('', double_consonants(''))
  end
end
