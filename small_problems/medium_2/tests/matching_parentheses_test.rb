require 'minitest/autorun'
require_relative '../matching_parentheses.rb'

class MatchingParenthesesTest < Minitest::Test
  def test_balanced_true
    expected = true
    actual = balanced?('What (is) this?')
    assert_equal(expected, actual)
  end

  def test_balanced_false
    expected = false
    actual = balanced?('What is) this?')
    assert_equal(expected, actual)
  end

  def test_other_cases_1
    assert_equal(false, balanced?('What (is this?'))
    assert_equal(true, balanced?('((What) (is this))?'))
    assert_equal(false, balanced?('((What)) (is this))?'))
    assert_equal(true, balanced?('Hey!'))
    assert_equal(false, balanced?(')Hey!('))
    assert_equal(false, balanced?('What ((is))) up('))
  end

  def test_other_cases_1_one_opening_no_close
    assert_equal(false, balanced?('What (is this?'))
  end

  def test_other_cases_2
    assert_equal(true, balanced?('((What) (is this))?'))
  end

  def test_other_cases_3
    assert_equal(false, balanced?('((What)) (is this))?'))
  end

  def test_other_cases_4
    assert_equal(true, balanced?('Hey!'))
  end

  def test_other_cases_5
    assert_equal(false, balanced?(')Hey!('))
  end

  def test_other_cases_6
    assert_equal(false, balanced?('What ((is))) up('))
  end
end

class MatchingPairsTest < Minitest::Test
  def test_balanced_true
    expected = true
    actual = balanced?('What [is] this?')
    assert_equal(expected, actual)
  end

  def test_balanced_false
    expected = false
    actual = all_brackets_balanced?('What is] this?')
    assert_equal(expected, actual)
  end

  def test_other_cases_1_one_opening_no_close
    assert_equal(false, all_brackets_balanced?('What [is this?'))
  end

  def test_other_cases_1_one_opening_no_close_curly
    assert_equal(false, all_brackets_balanced?('What {is this?'))
  end

  def test_other_cases_2
    assert_equal(true, all_brackets_balanced?('[[What] [is this]]?'))
  end

  def test_other_cases_3
    assert_equal(false, all_brackets_balanced?('[[What]] [is this]]?'))
  end

  def test_double_quotes_balanced
    assert_equal(true, all_brackets_balanced?('"What" "is this?"'))
  end

  def test_double_quotes_unbalanced
    assert_equal(false, all_brackets_balanced?('What" "is this?"'))
  end
end
