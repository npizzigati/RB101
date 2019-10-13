require 'minitest/autorun'
require_relative '../multiply_all_pairs.rb'

class MultiplyAllPairsTest < Minitest::Test
  def test_multiply_all_pairs
    assert_equal([2, 4, 4, 6, 8, 8, 12, 16],
                 multiply_all_pairs([2, 4], [4, 3, 1, 2]))
  end
end
