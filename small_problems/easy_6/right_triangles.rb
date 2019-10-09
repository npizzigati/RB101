# Right Triangles
# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the
# triangle (the diagonal side in the images below) should have one end at the
# lower-left of the triangle, and the other end at the upper-right.

# Examples:

# triangle(5)

#     *
#    **
#   ***
#  ****
# *****
# triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

=begin

input: positive integer n
output: displays a right triangle with each side having n stars

rules
explicit:
the hypotenuse should have one end at the lower-left and the other at the upper-right
implicit:
NA

algorithm
use String#rjust with padding set to n
for the string, use times Integer#times and '*' * n in the block, adding on a
  newline at each iteration
=end

def create_triangle_string(len)
  triangle_string = ''
  len.times { |i| triangle_string += ('*' * (i+1)).rjust(len) + "\n" }
  triangle_string
end

def triangle(len)
  puts create_triangle_string(len)
end
