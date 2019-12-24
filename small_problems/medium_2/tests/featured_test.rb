require 'minitest/autorun'
require_relative '../featured.rb'

class FeaturedTest < Minitest::Test
  def test_find_next_multiple_of_seven
    expected = 49
    actual = find_next_multiple(43)
    assert_equal(expected, actual)
  end

  def test_meets_other_conditions?
    expected = true
    actual = meets_other_conditions?(63)
    assert_equal(expected, actual)
  end

  def test_meets_other_conditions_false?
    expected = false
    actual = meets_other_conditions?(70)
    assert_equal(expected, actual)
  end

  def test_sample_cases
    assert_equal(21, featured(12))
    assert_equal(21, featured(20))
    assert_equal(35, featured(21))
    assert_equal(1029, featured(997))
    assert_equal(1043, featured(1029))
    assert_equal(1_023_547, featured(999_999))
    assert_equal(1_023_456_987, featured(999_999_987))
  end

  def test_error_message
    message = 'There is no possible number that fulfills those requirements'
    assert_raises(RuntimeError, message) do
      featured(9_999_999_999)
    end
  end
end
