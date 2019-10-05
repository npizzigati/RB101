require 'minitest/autorun'
require_relative '../cute_angles.rb'

class SpinMeTest < Minitest::Test
  def test_mms
    assert_equal(%(30°00'00"), dms(30))
    assert_equal(%(76°43'48"), dms(76.73))
    assert_equal(%(254°36'00"), dms(254.6))
    assert_equal(%(93°02'05"), dms(93.034773))
    assert_equal(%(0°00'00"), dms(0))
    assert_equal(%(360°00'00"), dms(360))
  end
end
