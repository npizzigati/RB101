require 'minitest/autorun'
require_relative '../grade_book.rb'

class GradeBookTest < Minitest::Test
  def test_get_grade
    assert_equal('A', get_grade(95, 90, 93))
    assert_equal('D', get_grade(50, 50, 95))
  end
end
