require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../ascii_string_value.rb'


class AsciiTest < Minitest::Test
  def test_that_it_returns_an_integer
    result = ascii_value('blah blah blah')
    assert_instance_of(Integer, result)
  end

  def test_it_returns_correct_ascii_values_for_character
    actual = char_ascii('r')
    expected = 114

    assert_equal(expected, actual)
  end

  def test_ret_array_of_all_ascii_values_each_character_in_string
    actual = build_value_array('blah')
    expected = [98, 108, 97, 104]

    assert_equal(expected, actual)
  end

  def test_ret_correct_ascii_sum_for_two_word_inputs_1
    actual = ascii_value('Four score')
    expected = 984

    assert_equal(expected, actual)
  end

  def test_ret_correct_ascii_sum_for_two_word_inputs_2
    actual = ascii_value('Launch School')
    expected = 1251

    assert_equal(expected, actual)
  end

  def test_ret_correct_ascii_sum_for_single_char_input
    actual = ascii_value('a')
    expected = 97

    assert_equal(expected, actual)
  end

  def test_ret_correct_ascii_sum_for_blank_string
    actual = ascii_value('')
    expected = 0

    assert_equal(expected, actual)
  end

  def test_ret_correct_ascii_sum_for_single_char_input
    actual = ascii_value('a')
    expected = 97

    assert_equal(expected, actual)
  end

  def test_alternate_implementation
    actual = ascii_value_2('Launch School')
    expected = 1251

    assert_equal(expected, actual)
  end
end
