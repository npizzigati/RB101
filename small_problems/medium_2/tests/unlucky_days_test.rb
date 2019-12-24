require 'minitest/autorun'
require_relative '../unlucky_days.rb'

class UnluckyDaysTest < Minitest::Test
  def test_determine_day_of_year_of_first_friday
    expected = Date.new(2019, 1, 4)
    actual = determine_first_friday(2019)
    assert_equal(expected, actual)
  end

  def test_determine_number_of_friday_13ths
    expected = 3
    actual = friday_13th(2015)
    assert_equal(expected, actual)
  end

  def test_various_sample_cases
    assert_equal(3, friday_13th(2015))
    assert_equal(1, friday_13th(1986))
    assert_equal(2, friday_13th(2019))
  end
end
