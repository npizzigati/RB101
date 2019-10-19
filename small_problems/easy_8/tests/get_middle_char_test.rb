require 'minitest/autorun'
require_relative '../get_middle_char.rb'

class GetMiddleCharTest < Minitest::Test
  def test_center_of
    assert_equal('e', center_of('I love ruby'))
    assert_equal(' ', center_of('Launch School'))
    assert_equal('un', center_of('Launch'))
    assert_equal('hs', center_of('Launchschool'))
    assert_equal('x', center_of('x'))
  end
end
