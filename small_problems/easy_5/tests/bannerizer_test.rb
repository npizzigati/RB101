require 'minitest/autorun'
require 'byebug'

require_relative '../bannerizer.rb'

class BannerizerTest < Minitest::Test
  def test_create_boxed_string
    expected =   "+--------------------------------------------+\n" \
                 "|                                            |\n" \
                 "| To boldly go where no one has gone before. |\n" \
                 "|                                            |\n" \
                 "+--------------------------------------------+\n"
    actual = create_boxed_string('To boldly go where no one has gone before.')
    assert_equal(expected, actual)
  end

  def test_create_boxed_string_empty
   expected =   "+--+\n" \
                "|  |\n" \
                "|  |\n" \
                "|  |\n" \
                "+--+\n"
   actual = create_boxed_string('')
   assert_equal(expected, actual)
  end

  def test_truncate
    expected = "This is a string that is longer than 80 lines. This is a string that is long"
    actual = truncate("This is a string that is longer than 80 lines. "\
                      "This is a string that is longer than 80 lines.")
    assert_equal(expected, actual)
  end

  def test_split_string
    expected = ["This is an example of a really very extremely long string that will have to",
                "be wrapped."]
    actual = split_string("This is an example of a really very extremely long string " \
                          "that will have to be wrapped.")
    assert_equal(expected, actual)
  end

  def test_find_break_index
    expected = 75
    actual = find_break_index('This is an example of a really very extremely' \
                               'long string that will have to be wrapped')
    assert_equal(expected, actual)
  end

  def test_remove_bookend_spaces
    expected = ['there are spaces here', 'and here too']
    actual = remove_bookend_spaces(['there are spaces here ', ' and here too'])
    assert_equal(expected, actual)
  end

  def test_create_middle
    expected = (
      "| This is an example of a really very extremely long string that will have to   |\n" \
      "| be wrapped.                                                                   |\n"
               )
    actual = create_middle('This is an example of a really very extremely ' \
                                 'long string that will have to be wrapped.', wrap: true)
    assert_equal(expected, actual)
  end

  def test_pad
    expected = 'This needs to be padded.                                                     '
    actual = pad('This needs to be padded.')
    assert_equal(expected, actual)
  end

end
