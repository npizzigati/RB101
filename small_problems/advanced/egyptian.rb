# Egyptian Fractions
# A Rational Number is any number that can be represented as the result
# of the division between two integers, e.g., 1/3, 3/2, 22/7, etc. The
# number to the left is called the numerator, and the number to the
# right is called the denominator.

# A Unit Fraction is a rational number where the numerator is 1.

# An Egyptian Fraction is the sum of a series of distinct unit fractions
# (no two are the same), such as:

# 1   1    1    1
# - + - + -- + --
# 2   3   13   15
# Every positive rational number can be written as an Egyptian
# fraction. For example:

#     1   1   1   1
# 2 = - + - + - + -
#     1   2   3   6
# Write two methods: one that takes a Rational number as an argument,
# and returns an Array of the denominators that are part of an Egyptian
# Fraction representation of the number, and another that takes an Array
# of numbers in the same format, and calculates the resulting Rational
# number. You will need to use the Rational class provided by Ruby.

# Examples:

# egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
# Every rational number can be expressed as an Egyptian Fraction. In
# fact, every rational number can be expressed as an Egyptian Fraction
# in an infinite number of different ways. Thus, the first group of
# examples may not show the same values as your solution. They do,
# however, show the expected form of the solution. The remaining
# examples merely demonstrate that the output of egyptian can be
# reversed by unegyptian.

=begin
egyptian
########
input: Rational number
output: Array of denominators of Egyptian fraction whose sum is that number

approach:
init rational results array to []
init cnt to 1
loop
if results.sum + Rational(1/cnt) eq original number then
   results << Rational(1/cnt)
   break
elsif results.sum + Rational(1/cnt) < original number then
   results.sum << Rational(1/cnt)
increment cnt by 1
end
map Array of Rationals to Array of denominators and return

unegyptian
create Array of Rationals using map; sum and return
=end

def egyptian(number)
  results = []
  count = 1
  loop do
    proposal = Rational(1, count)
    if results.sum + proposal == number
      results << proposal
      break
    elsif results.sum + proposal < number
      results << proposal
    end
    count += 1
  end
  results.map { |e| e.denominator }
end

def unegyptian(array)
  array.map { |e| Rational(1, e) }.sum
end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) #== Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
