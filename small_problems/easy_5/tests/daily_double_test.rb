require 'minitest/autorun'
require_relative '../daily_double.rb'
require 'byebug'

class DailyDoubleTest < Minitest::Test
  def test_crunch_1
    assert_equal('daily double', crunch('ddaaiillyy ddoouubbllee'))
  end

  def test_crunch_2
    assert_equal('4abcabcba', crunch('4444abcabccba'))
  end

  def test_crunch_3
    assert_equal('g', crunch('ggggggggggggggg'))
  end

  def test_crunch_4
    assert_equal('a', crunch('a'))
  end

  def test_crunch_5
    assert_equal('', crunch(''))
  end
end
