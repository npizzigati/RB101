# What Century is That?
# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

# Examples:

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# input: a year (integer)
# output: century, with the ending st, nd, rd or th.

# algorithm: subtract 1 from year, then divide integer by 100, then add one to
# result. That gives the century number. For the ending, match last digit
# against a hash with the endings

ENDINGS = { '1' => 'st', '2' => '2nd', '3' => '3rd' }

def century(year)
  number_part = ((year - 1) / 100 + 1).to_s
  century_ending = build_ending(number_part)
  number_part + century_ending
end

def build_ending(number_part)
  return 'th' if ['11', '12', '13'].include?(number_part[-2..-1])
  last_digit = number_part[-1]
  ENDINGS.fetch(last_digit, 'th')
end
