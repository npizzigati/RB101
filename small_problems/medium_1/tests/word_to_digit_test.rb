require 'minitest/autorun'
require_relative '../word_to_digit.rb'

class WordToDigitTest < Minitest::Test
  def setup
    @numbers = %w(zero one two three four five six seven eight nine ten)
  end

  def test_converts_five_into_5
    expected = '5'
    actual = convert_to_digit('five', @numbers)
    assert_equal(expected, actual)
  end

  def test_converts_nine_into_9
    expected = '9'
    actual = convert_to_digit('nine', @numbers)
    assert_equal(expected, actual)
  end

  def test_convert_string_with_only_mutiple_number_words_into_digits
    expected = '5 5 5 1 2 3 4'
    actual = convert_phrase('five five five one two three four')
    assert_equal(expected, actual)
  end

  def test_convert_string_with_mutiple_words_of_all_kinds
    expected = 'Please call me at 5 5 5 1 2 3 4 Thanks'
    actual = convert_phrase('Please call me at five five five ' \
                            'one two three four Thanks')
    assert_equal(expected, actual)
  end

  def test_convert_string_with_mutiple_words_of_all_kinds_and_punctuation
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    actual = convert_phrase('Please call me at five five five ' \
                            'one two three four. Thanks.')
    assert_equal(expected, actual)
  end
end
