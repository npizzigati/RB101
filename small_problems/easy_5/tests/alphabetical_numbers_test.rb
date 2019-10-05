require 'minitest/autorun'
require_relative '../alphabetical_numbers.rb'

class AlphabeticalNumbersTest < Minitest::Test
  def test_alphabetic_number_sort
    actual = alphabetic_number_sort((0..19).to_a)
    expected = [ 8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16,
                10, 13, 3, 12, 2, 0 ]
    assert_equal(expected, actual)
  end
end
