require 'minitest/autorun'
require_relative '../name_swapping.rb'

class NameSwappingTest < Minitest::Test
  def test_swap_name
    assert_equal('Roberts, Joe', swap_name('Joe Roberts'))
  end
end
