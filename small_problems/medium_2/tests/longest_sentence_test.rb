require 'minitest/autorun'
require_relative '../longest_sentence.rb'

class LongestSentenceTest < Minitest::Test
  def test_extracts_sentences_to_an_array
    text = 'This is a test. A big fat test! Or is it? Maybe not.'
    expected = ['This is a test.', 'A big fat test!', 'Or is it?', 'Maybe not.']
    actual = split_text_into_sentences(text)
    assert_equal(expected, actual)
  end

  def test_obtain_default_path_from_user
    expected = File.expand_path('~/launch_school/RB101/small_problems/medium_2/resources/longest1.txt')
    io = StringIO.new
    io << "\n"
    io.rewind
    $stdin = io
    begin
      actual = obtain_path_from_user
    ensure
      $stdin = STDIN
    end
    assert_equal(expected, actual)
  end

  def test_counts_words_in_sentence
    sentence = "This is a big fat sentence."
    expected = 6
    actual = count_words(sentence)
    assert_equal(expected, actual)
  end

  def test_find_longest_sentence
    text = 'This is a test. A really big fat test! Or is it? Maybe not.'
    expected = "A really big fat test!"
    actual = find_longest_sentence(text)
    assert_equal(expected, actual)
  end

  def test_retrieve_text_from_path 
    path = File.expand_path('~/launch_school/RB101/small_problems/medium_2/resources/test_text.txt')
    expected = "This is just a test text. Nothing to see here.\n"
    actual = retrieve_text_from_path(path)
    assert_equal(expected, actual)
  end

  def test_longest_sentence
    expected = /Longest/
    io = StringIO.new
    io << "\n"
    io.rewind
    $stdin = io
    begin
      assert_output(expected) { longest_sentence }
    ensure
      $stdin = STDIN
    end
  end
end
