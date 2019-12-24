# Tri-Angles
# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
# all angles must be greater than 0: if either of these conditions is not
# satisfied, the triangle is invalid.

# Write a method that takes the 3 angles of a triangle as arguments, and returns
# a symbol :right, :acute, :obtuse, or :invalid depending on whether the
# triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating
# point errors. You may also assume that the arguments are specified in degrees.

# Examples:

# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

=begin
problem
*******
input: 3 angles (floats or integers) as arguments
output: :right, :acute, :obtuse, :invalid

rules
=====
explicit: - Assume integer values are entered, as degrees
          - Triangle is invalid if sum of angles is not 180 or any angle is <= 0
implicit: - NA

examples
********
see above

data structures and algorithm
*****************************
Check whether triangle is valid. If valid, check whether one angle is 90 degrees
(right triangle). Else check if any one angle is > 09 degrees (obtuse
triangle). Else triangle is acute.

Manipulate angles in an array.
=end

def valid?(*angles)
  angles.sum == 180 and angles.none? { |angle| angle <= 0 }
end

def determine_type(*angles)
  if angles.any? { |angle| angle == 90 }
    :right
  elsif angles.any? { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

def triangle(*angles)
  if !valid?(*angles)
    return :invalid
  else
    determine_type(*angles)
  end
end
