require 'minitest/autorun'
require_relative '../seeing_stars.rb'

class StarTest < Minitest::Test
  def test_create_blank_grid
    expected = ['   ',
                '   ',
                '   ']
    actual = create_blank_grid(3)
    assert_equal(expected, actual)
  end

  def test_grid_lines_are_not_the_same_object
    grid = create_blank_grid(3)
    expected = ['*  ',
                '   ',
                '   ']
    grid[0][0] = '*'
    assert_equal(expected, grid)
  end
  
  def test_determine_centerpoint
    expected = [2, 2]
    actual = determine_centerpoint(5)
    assert_equal(expected, actual)
  end

  def test_replace_grid_coordinates
    expected = ['* * *',
                ' *** ',
                '*****',
                ' *** ',
                '* * *']
    star_coordinates = [[0, 0], [0, 2], [0, 4], [1, 1], [1, 2], [1, 3],
                        [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
                        [3, 1], [3, 2], [3, 3], [4, 0], [4, 2], [4, 4]]
    grid = ['     ',
            '     ',
            '     ',
            '     ',
            '     ']
    actual = replace_grid_coordinates(grid, star_coordinates)
    assert_equal(expected, actual)
  end

  def test_print_star
    grid     = ['* * *',
                ' *** ',
                '*****',
                ' *** ',
                '* * *']
    expected =  "* * *\n" \
                " *** \n" \
                "*****\n" \
                " *** \n" \
                "* * *\n"
    assert_output(expected) { print_star(grid) }
  end
  
  def test_determine_star_coordinates
    sample_coordinates = [[0, 0], [0, 2], [0, 4], [1, 1], [1, 2], [1, 3],
                          [2, 0], [2, 1], [2, 2], [2, 3], [2, 4],
                          [3, 1], [3, 2], [3, 3], [4, 0], [4, 2], [4, 4]]
    expected = true
    centerpoint = [2, 2]
    number = 5
    calculated_coordinates = determine_star_coordinates(centerpoint, number)
    actual = calculated_coordinates.all? { |coord| sample_coordinates.include? coord }
    assert_equal(expected, actual)
  end

  def test_centerpoint_is_included_in_star_coordinates
    expected = true
    coordinates = determine_star_coordinates([1, 1], 3)
    actual = coordinates.include?([1, 1])
    assert_equal(expected, actual)
  end
end
