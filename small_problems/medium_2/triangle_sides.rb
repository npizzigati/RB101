# Triangle Sides
# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied, the
# triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles, scalene,
# or invalid.

# Examples:

# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

=begin
problem
*******
input; three numbers, lengths of three sides of triangle
output: symbol of :equilateral, :isosceles, :scalene, or :invalid, depending on
the input measurements

rules
*****
explicit: triangle is invalid if the sums of the shortests sides are less than the 
length of the longest side
implicit: input numbers may be integers or floats

examples/test cases
*******************
see problem description above

data structures and algorithm
*****************************
Check whether the longest side is greater than the sum of the other two
sides (sort measurements to get the max and the other two) to determine if
triangle is a valid triangle; also check whether all sides have a length greater
than or equal to zero. If either of these two conditions exists, then input
numbers do not form a triangle. If input validates as triangle, put input arguments
into an array an call #uniq on it. If the size of the resulting array is 1, the
triangle is an equilateral triangle; 2, isosceles, and 3, scalene.
=end

def valid_triangle?(*sides)
  first, *rest = sides.sort { |a, b| b <=> a }
  if sides.all? { |side| side > 0 } && first < rest.sum
    true
  else
    false
  end
end

def determine_type(*sides)
  case sides.uniq.length
  when 3
    :scalene
  when 2
    :isosceles
  when 1
    :equilateral
  end
end

def input_valid?(*args)
  args.all? { |arg| arg.class == Integer || arg.class == Float } &&
    args.count == 3
end

def triangle(*sides)
  if !input_valid?(*sides)
    raise ArgumentError, "Too many or too few parameters"
  end
  if !valid_triangle?(*sides)
    :invalid
  else
    determine_type(*sides)
  end
end
