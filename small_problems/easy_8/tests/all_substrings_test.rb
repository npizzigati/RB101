require 'minitest/autorun'
require_relative '../all_substrings.rb'

class SubstringsTest < Minitest::Test
  def test_substrings
    assert_equal([ 'a', 'ab', 'abc', 'abcd', 'abcde', 'b', 'bc',
                   'bcd', 'bcde', 'c', 'cd', 'cde', 'd', 'de',
                   'e'], substrings('abcde'))
  end
end
