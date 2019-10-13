require 'minitest/autorun'
require_relative '../capitalize_words.rb'

class CapitalizeWordsTest < Minitest::Test
  def test_word_cap
    assert_equal('Four Score And Seven',
                 word_cap('four score and seven'))
    assert_equal('The Javascript Language',
                 word_cap('the javaScript language'))
    assert_equal('This Is A "quoted" Word',
                 word_cap('this is a "quoted" word'))
  end

  def test_word_cap2
    assert_equal('Four Score And Seven',
                 word_cap2('four score and seven'))
    assert_equal('The Javascript Language',
                 word_cap2('the javaScript language'))
    assert_equal('This Is A "quoted" Word',
                 word_cap2('this is a "quoted" word'))
  end

  def test_word_cap3
    assert_equal('Four Score And Seven',
                 word_cap3('four score and seven'))
    assert_equal('The Javascript Language',
                 word_cap3('the javaScript language'))
    assert_equal('This Is A "quoted" Word',
                 word_cap3('this is a "quoted" word'))
  end

  def test_find_space_indices
    expected = [10, 7, 2]
    actual = find_space_indices('My name is mud.')
    assert_equal(expected, actual)
  end
end
