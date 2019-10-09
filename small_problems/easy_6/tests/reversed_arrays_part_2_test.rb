require 'minitest/autorun'
require_relative '../reversed_arrays_part_2.rb'

class ReveredArrays2Test < Minitest::Test
  def test_reversed_arrays_part2
    assert_equal([4,3,2,1], reverse([1,2,3,4]))
    assert_equal(%w(c d e b a), reverse(%w(a b e d c)))
    assert_equal(['abc'], reverse(['abc']))
    assert_equal([], reverse([]))
  end

  def test_same_object
    list = [1, 3, 2]
    new_list = reverse(list)
    refute_equal(list.object_id, new_list.object_id)
  end

end
