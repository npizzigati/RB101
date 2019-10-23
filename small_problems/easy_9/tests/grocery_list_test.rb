require 'minitest/autorun'
require_relative '../grocery_list.rb'

class GroceryListTest < Minitest::Test
  def test_buy_fruit
    assert_equal(["apples", "apples", "apples", "orange",
                  "bananas","bananas"],
                 buy_fruit([["apples", 3], ["orange", 1],
                            ["bananas", 2]]))
  end
end
