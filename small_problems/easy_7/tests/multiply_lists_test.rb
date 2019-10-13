require 'minitest/autorun'
require_relative '../multiply_lists.rb'

class MultiplyListsTest < Minitest::Test
  def test_multiply_lists
    assert_equal([27, 50, 77],
                   multiply_list([3, 5, 7], [9, 10, 11]))
  end
end
