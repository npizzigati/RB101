require 'minitest/autorun'
require_relative '../combine_two_lists.rb'

class CombineTwoListsTest < Minitest::Test
  def test_interleave
    assert_equal([1, 'a', 2, 'b', 3, 'c'],
                 interleave([1, 2, 3], ['a', 'b', 'c']))
  end

  def test_interleave2
    assert_equal([1, 'a', 2, 'b', 3, 'c'],
                 interleave2([1, 2, 3], ['a', 'b', 'c']))
  end

  def test_interleave_with_zip
    assert_equal([1, 'a', 2, 'b', 3, 'c'],
                 interleave_with_zip([1, 2, 3], ['a', 'b', 'c']))
  end
end

