require "minitest/autorun"
require_relative '../diamonds.rb'

class DiamondsTest < Minitest::Test
  def test_top_half_lines
    expected = ['*', '***', '*****', '*******']
    actual = top_half_lines(9)
    assert_equal(expected, actual)
  end

  def test_diamonds
    expected = <<-output
 * 
***
 * 
    output
    assert_output(expected) { diamond(3) }
  end

  def test_hollow_diamonds
    expected = <<-output
  *  
 * * 
*   *
 * * 
  *  
    output
    assert_output(expected) { hollow_diamond(5) }
  end
end
