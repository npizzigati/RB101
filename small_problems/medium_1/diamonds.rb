
# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

# Examples

# diamond(1)

# *
# diamond(3)

#  *
# ***
#  *
# diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

=begin
input: odd integer
output: display 4 pointed diamond in n x n grid
rules:
explicit: assume input will always be odd integer
          diamond is made up of asterisks
implicit: input may not be negative
          an arg of 1 gives a single left-justified asterisk
algorithm:
use format to center the asterisks on each line
initialize empty array: lines
set range equal to 1..(n-2)
step through range in steps of 2
   push (idx * '*') to lines array

print triangle:
  iterate through lines array
    puts each line formatted to be centered in n spaces
  puts center line: n * '*'
    reverse lines array and put contents
=end

def top_half_lines(diamond_size)
  lines = []
  range = (1..(diamond_size - 2))
  range.step(2) do |len|
    lines << '*' * len
  end
  lines
end

def diamond(diamond_size)

  top_half = top_half_lines(diamond_size)
  # first half
  top_half.each do |line|
    puts line.center(diamond_size)
  end

  # center
  puts '*' * diamond_size

  # bottom half
  top_half.reverse.each do |line|
    puts line.center(diamond_size)
  end
end

# Further Exploration
# Try modifying your solution or our solution so it prints only the outline of
# the diamond:

# diamond(5)

#   *
#  * *
# *   *
#  * *
#   *

# algorithm change
# alter the line in top_half_lines
# lines << '*' + ' ' * (len - 2) + '*'
# and the center line
# puts '*' + ' ' * (diamond_size - 2) + '*'

def hollow_top_half_lines(diamond_size)
  lines = []
  range = (1..(diamond_size - 2))
  range.step(2) do |len|
    if len == 1
      lines << '*'
    else
      lines << ('*' + ' ' * (len - 2) + '*')
    end
  end
  lines
end

def hollow_diamond(diamond_size)
  top_half = hollow_top_half_lines(diamond_size)
  # first half
  top_half.each do |line|
    puts line.center(diamond_size)
  end

  # center
  puts '*' + ' ' * (diamond_size - 2) + '*'

  # bottom half
  top_half.reverse.each do |line|
    puts line.center(diamond_size)
  end
end
