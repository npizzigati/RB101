require 'minitest/autorun'
require_relative '../uppercase_check.rb'

class UppercaseCheckTest < Minitest::Test
  def test_uppercase?
    assert_equal(false, uppercase?('t'))
    assert_equal(true, uppercase?('T'))
    assert_equal(false, uppercase?('Four Score'))
    assert_equal(true, uppercase?('FOUR SCORE'))
    assert_equal(true, uppercase?('4SCORE!'))
    assert_equal(true, uppercase?(''))
  end
end
