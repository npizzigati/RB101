# Grade book
# Write a method that determines the mean (average) of the three scores passed
# to it, and returns the letter value associated with that grade.

# Numerical Score Letter	Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for
# negative values or values greater than 100.

# Example:

# get_grade(95, 90, 93) == "A"
# get_grade(50, 50, 95) == "D"

=begin
input: three integers
output: a letter grade
rules:
explicit:
see examples for letter grade ranges
no need to check for values beyond grade range
implicit: NA
algorithm:
accept 3 grades into a catch-all splat args
assign array to args
create has of grade ranges
calculate average by summing and then dividing by array length
iterated through grade range hash and printing matching grade letter
=end

def get_grade(*args)
  grades = args
  letters = { (0...60) => 'F', (60...70) => 'D',
              (70...80) => 'C', (80...90) => 'B',
              (90...100) => 'A', (100...) => 'A+' }
  avg = grades.sum / args.size
  letters.each { |k, v| return v if k.include?(avg) }
end

# Further exploration
# How would you handle this if there was a possibility of extra credit grades
# causing it to exceed 100 points?

# Change:
# add an A+ category for grades over 100
# (change implemented above)
