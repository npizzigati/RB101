require 'minitest/autorun'
require_relative '../after_midnight_2.rb'

MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = MINUTES_IN_HOUR * 24

class AfterMidnight2 < Minitest::Test
  def test_extract_hours_and_minutes
    actual = extract_hours_and_minutes('02:30')
    expected = {:hours => 2, :minutes => 30}
    assert_equal(expected, actual)
  end

  def test_convert_to_integer
    actual = convert_to_integer({:hours => 5, :minutes => 20})
    expected = 320
    assert_equal(expected, actual)
  end

  def test_after_midnight_0
    actual = after_midnight('00:00')
    expected = 0
    assert_equal(expected, actual)
  end

  def test_before_midnight_0
    actual = before_midnight('00:00')
    expected = 0
    assert_equal(expected, actual)
  end

  def test_after_midnight_12_34
    actual = after_midnight('12:34')
    expected = 754
    assert_equal(expected, actual)
  end

  def test_before_midnight_12_34
    actual = before_midnight('12:34')
    expected = 686
    assert_equal(expected, actual)
  end

  def test_after_midnight_24_00
    actual = after_midnight('24:00')
    expected = 0
    assert_equal(expected, actual)
  end

  def test_before_midnight_24_00
    actual = before_midnight('24:00')
    expected = 0
    assert_equal(expected, actual)
  end

  def test_after_midnight_v2
    actual = after_midnight_v2('4:30')
    expected = 270
    assert_equal(expected, actual)
  end

  def test_before_midnight_v2
    actual = before_midnight_v2('5:00')
    expected = 300
    assert_equal(expected, actual)
  end
end
