require 'minitest/autorun'
require_relative '../leading_substrings.rb'

class LeadingSubstringsTest < Minitest::Test
  def test_substrings_at_start
    assert_equal(['a', 'ab', 'abc'], substrings_at_start('abc'))
    assert_equal(['a'], substrings_at_start('a'))
    assert_equal(['x', 'xy', 'xyz', 'xyzz', 'xyzzy'],
                 substrings_at_start('xyzzy'))
  end
end
