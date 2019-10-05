require 'minitest/autorun'
require_relative '../clean_up_the_words.rb'

class CleanUpTheWordsTest < Minitest::Test
  def test_clean_up_phrase
    actual = cleanup("---what's my +*& line?")
    expected = ' what s my line '
    assert_equal(expected, actual)
  end

  def test_clean_up_phrase2
    actual = clean_up2("---what's my +*& line?")
    expected = ' what s my line '
    assert_equal(expected, actual)
  end
end
