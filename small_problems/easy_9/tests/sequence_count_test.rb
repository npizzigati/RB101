require 'minitest/autorun'
require_relative '../sequence_count.rb'

class SequenceCountTest < Minitest::Test
  def test_sequence
    assert_equal([1, 2, 3, 4, 5], sequence(5, 1))
    assert_equal([-7, -14, -21, -28], sequence(4, -7))
    assert_equal([0, 0, 0], sequence(3, 0))
    assert_equal([], sequence(0, 1000000))
  end
end
