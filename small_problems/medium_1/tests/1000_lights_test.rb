require 'minitest/autorun'
require_relative '../1000_lights.rb'

class Lightstest < Minitest::Test
  def test_find_lights_on_5
    num_of_lights = 5
    expected = [1, 4]
    actual = find_lights_on(num_of_lights)
    assert_equal(expected, actual)
  end

  def test_find_lights_on_10
    num_of_lights = 10
    expected = [1, 4, 9]
    actual = find_lights_on(num_of_lights)
    assert_equal(expected, actual)
  end
end
