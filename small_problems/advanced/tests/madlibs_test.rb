require 'minitest/autorun'
require_relative '../madlibs.rb'

class MadlibsTest < Minitest::Test
  def test_populate_array_with_paragraphs_in_file
    expected = false
    actual = populate_story_array.empty?
    assert_equal(expected, actual)
  end

  def test_extract_blanks
    expected = false
    story = populate_story_array
    actual = extract_blanks(story).empty?
    assert_equal(expected, actual)
  end

  def test_map_blanks
    expected = true
    blanks = %w(ing_verb noun adjective)
    mapped_blanks = map_blanks(blanks)
    actual = mapped_blanks.count == 3 &&
             mapped_blanks.none? { |member| member.empty? } &&
             CHOICES['noun'].include?(mapped_blanks[1])
    assert_equal(expected, actual)
  end

  def test_replace_blanks_with_format_placeholder
    original = ['A vacation is when you take a trip to some {adjective} place' \
               ' with your {adjective} family. Usually you go to some place' \
               ' that is near a/an {noun} or up on a/an {noun}.']
    expected = ['A vacation is when you take a trip to some %s place' \
               ' with your %s family. Usually you go to some place' \
               ' that is near a/an %s or up on a/an %s.']
    actual = replace_blanks_with_format_placeholder(original)
    assert_equal(expected, actual)
  end

  def test_insert_replacement_words
    original = ['A vacation is when you take a trip to some %s place' \
               ' with your %s family. Usually you go to some place' \
               ' that is near a/an %s or up on a/an %s.']
    replacements = %w(infected beautiful Kensington corner\ store)
    expected = ['A vacation is when you take a trip to some infected place' \
               ' with your beautiful family. Usually you go to some place' \
               ' that is near a/an Kensington or up on a/an corner store.']
    actual = insert_replacement_words(original, replacements)
    assert_equal(expected, actual)
  end
end
