require 'minitest/autorun'
require_relative '../letter_swap.rb'

class LetterSwapTest < Minitest::Test
  def test_letter_swap_1
    actual = letter_swap('Oh what a wonderful day it is')
    expected = ('hO thaw a londerfuw yad ti si')
    assert_equal(expected, actual)
  end

  def test_letter_swap_2
    actual = letter_swap('Abcde')
    expected = ('ebcdA')
    assert_equal(expected, actual)
  end

  def test_letter_swap_3
    actual = letter_swap('a')
    expected = ('a')
    assert_equal(expected, actual)
  end
end

