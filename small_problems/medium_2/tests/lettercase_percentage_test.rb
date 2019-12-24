require 'minitest/autorun'
require_relative '../lettercase_percentage.rb'

class LowercasePercentageTest < Minitest::Test
  def test_calculate_percentages
    assert_equal({ lowercase: 50, uppercase: 10, neither: 40 },
                 calculate_percentages({ lowercase: 5, uppercase: 1, neither: 4 }, 10))
  end

  def test_rounds_percentages
    expected = { :lowercase => 66.67, :uppercase => 33.33, :neither => 0.0 }
    actual = letter_percentages('abcdefGHI')
    assert_equal(expected, actual)
  end

  def test_letter_percentages 
    assert_equal({ lowercase: 37.5, uppercase: 37.5, neither: 25 }, letter_percentages('AbCd +Ef'))
    assert_equal({ lowercase: 0, uppercase: 0, neither: 100 }, letter_percentages('123'))
  end

  def test_letter_numbers
    expected = { lowercase: 5, uppercase: 1, neither: 4 }
    actual = letter_numbers('abCdef 123')
    assert_equal(expected, actual)
  end
end
