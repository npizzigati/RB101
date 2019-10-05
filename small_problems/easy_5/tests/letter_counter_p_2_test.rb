require 'minitest/autorun'
require_relative '../letter_counter_p_2.rb'

class LetterCounter1 < Minitest::Test
  def test_letter_counter_4_words_and_period
    actual = word_sizes('four score and seven.')
    expected = { 3 => 1, 4 => 1, 5 => 2 }

    assert_equal(expected, actual)
  end

  def test_letter_counter_8_words_and_punctuation
    actual = word_sizes('hey diddle diddle, the cat and the fiddle!')
    expected = { 3 => 5, 6 => 3 }

    assert_equal(expected, actual)
  end

  def test_letter_counter_3_words_and_punctuation
    actual = word_sizes("what's up doc?")
    expected = { 5 => 1, 2 => 1, 3 => 1 }

    assert_equal(expected, actual)
  end

  def test_letter_counter_empty_string
    actual = word_sizes('')
    expected = {}

    assert_equal(expected, actual)
  end

  def test_remove_punctuation
    actual = remove_punctuation("it's")
    expected = ("its")

    assert_equal(expected, actual)
  end
end
