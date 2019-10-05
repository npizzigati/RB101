require 'minitest/autorun'
require_relative 'test_helper.rb'
require_relative '../after_midnight.rb'

class AfterMidnightTest < Minitest::Test
  def test_calculate_day_delta
    actual = calculate_day_delta(400000)
    expected = 1120

    assert_equal(expected, actual)
  end

  def test_convert_to_hh_mm
    actual = convert_to_hh_mm(640)
    expected = '10:40'

    assert_equal(expected, actual)
  end

  def test_time_of_day_00_00
    expected = '00:00'
    actual = time_of_day(0)

    assert_equal(expected, actual)
  end

  def test_time_negative_minutes
    expected = '23:57'
    actual = time_of_day(-3)

    assert_equal(expected, actual)
  end

  def test_time_negative_minutes_large
    expected = '01:29'
    actual = time_of_day(-4231)

    assert_equal(expected, actual)
  end

  def test_time_positive_minutes
    expected = '02:00'
    actual = time_of_day(3000)

    assert_equal(expected, actual)
  end

  def test_calculate_day_and_time
    expected = 'Monday 00:00:00'
    actual = calculate_day_and_time(1440)

    assert_equal(expected, actual)
  end

  def test_calculate_day_and_time_negative
    expected = 'Saturday 00:00:00'
    actual = calculate_day_and_time(-1440)

    assert_equal(expected, actual)
  end
end
