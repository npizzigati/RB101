require "minitest/autorun"
require_relative "../right_triangles.rb"

class RightTriangleTest < Minitest::Test
  def test_right_triangle
    actual = create_triangle_string(5)
    expected = "    *\n" \
               "   **\n" \
               "  ***\n" \
               " ****\n" \
               "*****"
    assert_equal(expected, actual)
  end

  def test_right_triangle_2
    actual = create_triangle_string(9)
    expected = "        *\n" \
               "       **\n" \
               "      ***\n" \
               "     ****\n" \
               "    *****\n" \
               "   ******\n" \
               "  *******\n" \
               " ********\n" \
               "*********"
    assert_equal(expected, actual)
  end
end
