require 'minitest/autorun'
require_relative '../counting_up.rb'

class CountingUpTest < Minitest::Test
  def test_sequence
    assert_equal([1, 2, 3, 4, 5], sequence(5))
    assert_equal([1, 2, 3], sequence(3))
    assert_equal([1], sequence(1))
  end
end
