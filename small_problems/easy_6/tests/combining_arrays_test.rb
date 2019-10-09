require 'minitest/autorun'
require_relative '../combining_arrays.rb'

class CombiningArraysTest < Minitest::Test
  def test_merge
    assert_equal([1, 3, 5, 6, 9], merge([1, 3, 5], [3, 6, 9]))
  end
end
