# Unlucky Days
# Write a method that returns the number of Friday the 13ths in the year given
# by an argument. You may assume that the year is greater than 1752 (when the
# United Kingdom adopted the modern Gregorian Calendar) and that it will remain
# in use for the foreseeable future.

# Examples:

# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

=begin

problem
*******
input: integer inputted as argument
output: integer

rules
-----
explicit: - output is number of Friday the 13ths ocurring in input year
          - assume Gregorian calendar (year will be greater than 1752)

implicit: - year may be a future year (and Gregorian calendar will remain in
            effect)

questions: - should there be error checking?

examples
********
see above

data structures and algorithms
******************************
To determine if a date is a Friday the 13th, use the methods #mday (monthday)
and #friday? of the Date class. Find the first Friday of the year, then add
seven to that day to find each consecutive Friday. Use mday to determine whether
it is a 13th.

=end

require 'date'

def determine_first_friday(year)
  7.times do |idx| 
    day = Date.new(year, 1, idx + 1)
    return day if day.friday? 
  end
end

def friday_13th(year)
  first_friday = determine_first_friday(year)
  count = 0
  first_friday.step(Date.new(year, -1, -1), 7) do |day|
    count += 1 if day.friday? && day.mday == 13
  end 
  count
end
