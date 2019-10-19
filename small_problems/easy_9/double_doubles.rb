# Double Doubles
# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, 44, 3333,
# 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned
# as-is.

# Examples:

# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# Note: underscores are used for clarity above. Ruby lets you use underscores
# when writing long numbers; however, it does not print the underscores when
# printing long numbers. Don't be alarmed if you don't see the underscores when
# running your tests.

=begin
input: an integer
output: 2 * number if not a "double number"; if a double number, return same

rules:
explicit:
underscores in input will be automatically ignored by ruby
implicit: na
algorithm:
determine if number is double number:
idx 0...len/2 and len/2... should be equal
if double number return same number
else return number * 2
=end

def twice(num)
  num_str = num.to_s
  len = num_str.size
  half = len / 2
  if len.even? && num_str[0...(half)] == num_str[(half)...]
    return num
  else
    return num * 2
  end
end
