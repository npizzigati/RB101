# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd
# integer that is supplied as an argument to the method. The smallest such star
# you need to handle is a 7x7 grid.

# Examples

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

=begin
input: one integer
output: a series of strings printed to the screen.

rules:
explicit: - input is an odd integer n
          - output is an 8-point star in an n x n grid
          - smallest grid to be handled is 7 x 7
implicit: - there is no upper limit to the grid size
          - at each grid square out from the center of the grid, the distance
            between horizontally and vertically adjacent asterisks is increased by 1
          - The lines extending out from the center of the star extend on a
            Cartesian plane in the directions: x + 1, y; x - 1, y; x, y + 1;
            x, y - 1; x + 1, y + 1; x + 1, y - 1; x - 1, y - 1; x - 1, y + 1

algorithm and data structures:
Create n x n blank grid as an array of strings (each array consisting entirely of
space characters).
Find coordinates of centerpoint of grid
Determine coordinates of star going out from centerpoint with (n - 1) / 2 stars
in each direction (as listed above in implicit rules)
Change the space at each coordinate to a star

=end
require 'pry'

def create_blank_grid(number)
  grid = []
  number.times do
    grid << (' ' * number)
  end
  grid
end

def determine_centerpoint(number)
  [number / 2, number / 2]
end

def determine_star_coordinates(centerpoint, number)
  star_coordinates = []
  y, x = centerpoint
  star_coordinates << centerpoint
  1.upto(number / 2) do |i|
    star_coordinates.push([y + i, x], [y - i, x], [y, x + i], [y, x - i],
                          [y + i, x + i], [y + i, x - i],
                          [y - i, x + i], [y - i, x - i])
  end
  star_coordinates
end

def replace_grid_coordinates(grid, star_coordinates)
  star_coordinates.each do |coord_pair|
    y, x = coord_pair
    grid[y][x] = '*'
  end
  grid
end

def print_star(grid)
  puts grid
end

def star(number)
  grid = create_blank_grid(number)
  center = determine_centerpoint(number)
  star_coordinates = determine_star_coordinates(center, number)
  replace_grid_coordinates(grid, star_coordinates)
  print_star(grid)
end
