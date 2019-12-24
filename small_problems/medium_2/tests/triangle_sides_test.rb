require 'minitest/autorun'
require_relative '../triangle_sides.rb'

class TriangleSidesTest < Minitest::Test
  def test_determine_whether_triangle_is_valid
    sides = [2, 4, 3]
    expected = true
    actual = valid_triangle?(*sides)
    assert_equal(expected, actual)
  end

  def test_determine_type_scalene
    sides = [3, 4, 5]
    expected = :scalene
    actual = determine_type(*sides)
    assert_equal(expected, actual)
  end

  def test_determine_type_isosceles
    sides = [3, 5, 5]
    expected = :isosceles
    actual = determine_type(*sides)
    assert_equal(expected, actual)
  end

  def test_input_valid_false
    args = [1, 2, 'x']
    expected = false
    actual = input_valid?(*args)
    assert_equal(expected, actual)
  end

  def test_input_valid_true
    args = [1, 2, 2.5]
    expected = true
    actual = input_valid?(*args)
    assert_equal(expected, actual)
  end

  def test_input_valid_too_many
    args = [1, 2, 2.5, 4]
    expected = false
    actual = input_valid?(*args)
    assert_equal(expected, actual)
  end

  def test_sample_test_cases
    assert_equal(:equilateral, triangle(3, 3, 3))
    assert_equal(:isosceles, triangle(3, 3, 1.5))
    assert_equal(:scalene, triangle(3, 4, 5))
    assert_equal(:invalid, triangle(0, 3, 3))
    assert_equal(:invalid, triangle(3, 1, 1))
  end
end
