require 'minitest/autorun'
require_relative '../list_include_this.rb'

class ListIncludeThisTest < Minitest::Test
  def test_list_include_this
    assert_equal(true, include?([1,2,3,4,5], 3))
    assert_equal(false, include?([1,2,3,4,5], 6))
    assert_equal(false, include?([], 3))
    assert_equal(true, include?([nil], nil), '[nil] - nil test failed')
    assert_equal(false, include?([], nil), '[] - nil test failed')
  end
end
