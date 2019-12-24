require 'minitest/autorun'
require_relative '../tri-angles.rb'

class TrianglesTest < Minitest::Test
  def test_valid_triangle
    angles = [50, 90, 40]
    expected = true
    actual = valid?(*angles)
    assert_equal(expected, actual)
  end

  def test_determine_type_right
    angles = [50, 90, 40]
    expected = :right
    actual = determine_type(*angles)
    assert_equal(expected, actual)
  end

  def test_determine_type_right
    angles = [50, 90, 40]
    expected = :right
    actual = determine_type(*angles)
    assert_equal(expected, actual)
  end

  def test_determine_type_obtuse
    angles = [50, 110, 20]
    expected = :obtuse
    actual = determine_type(*angles)
    assert_equal(expected, actual)
  end

  def test_determine_type_acute
    angles = [50, 80, 50]
    expected = :acute
    actual = determine_type(*angles)
    assert_equal(expected, actual)
  end

  def test_determine_invalid
    angles = [50, 80, 40]
    expected = :invalid
    actual = triangle(*angles)
    assert_equal(expected, actual)
  end

  def test_integration_acute
    angles = [50, 80, 50]
    expected = :acute
    actual = determine_type(*angles)
    assert_equal(expected, actual)
  end

  def test_sample_test_cases
    assert_equal(:acute, triangle(60, 70, 50))
    assert_equal(:right, triangle(30, 90, 60))
    assert_equal(:obtuse, triangle(120, 50, 10))
    assert_equal(:invalid, triangle(0, 90, 90))
    assert_equal(:invalid, triangle(50, 50, 50))
  end
end
