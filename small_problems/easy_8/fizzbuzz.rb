# fizzbuzz
# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
  # divisible by 5, print "Buzz", and finally if a number is divisible by 3 and
# 5, print "FizzBuzz".

# Example:

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz,
# 13, 14, FizzBuzz

=begin
input: two integers, starting num and ending num
output: all numbers between the two, with exceptions (see rules)

rules
explicit:
if output number is divisible by 3, print 'Fizz'
If divisible by 5, print 'Buzz'
If divisible by 3 and 5, print 'FizzBuzz'
implicit:
list is inclusive of start and end numbers
questions:
Should a newline be printed after each num or Fizz/Buzz, or a comma?

algorithm:
loop using a range of the start and end numbers
  if num % 3 == 0 then print 'Fizz'
  If it equals 5 print 'Buzz'
  print num
  print "\n"
=end

def fizzbuzz(startnum, endnum)
  (startnum..endnum).each do |num|
    buf = ''
    buf = 'Fizz' if num % 3 == 0
    buf += 'Buzz' if num % 5 == 0
    buf = num if buf.empty?
    puts buf
  end
end
