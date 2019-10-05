# After Midnight (Part 1)
# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# You may not use ruby's Date and Time classes.

# Examples:

# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"
# Disregard Daylight Savings and Standard Time and other complications.

# input: an integer - the number of minutes before or after midnight
# output: string representing time of day in 24-hr hh:mm format
# --rules--
# explicit:
#   1. should Method work with any integer input (will need to circle around or
#   take modulus)
#   2. Disregard daylight savings time
# implicit:
#   1. if arg is 0, return value should be '00:00'
# algorithm:
# 1. Determine number of minutes in a day.
# 2. Take modulo of user arg minutes over minutes in day. If negative, subtract
#    from minutes in day; if positive, do not.
# 4. Convert minutes into hh:mm format by: use divmod to get quotient and
#    remainder dividing by 60.
# 5. Return hh:mm format string.

require 'time'

SECONDS_IN_MINUTE = 60
MINUTES_DAY = 24 * 60
MINUTES_WEEK = MINUTES_DAY * 7
BASELINE_TIME = Time.strptime('Sunday 24:00:00',"%A %T")

def calculate_day_delta(num)
  num % MINUTES_DAY
end

def convert_to_hh_mm(minutes)
  hours, minutes = minutes.divmod(60)
  hours = 0 if hours == 24
  format("%.2d:%.2d", hours, minutes)
end

def time_of_day(minutes)
  minutes = calculate_day_delta(minutes)
  convert_to_hh_mm(minutes)
end

# Further Exploration
# How would you approach this problem if you were allowed to use ruby's Date
# and Time classes? Suppose you also needed to consider the day of week?
# (Assume that delta_minutes is the number of minutes before or after midnight
# between Saturday and Sunday; in such a method, a delta_minutes value of -4231
# would need to produce a return value of Thursday 01:29.)

# input: integer representing number of minutes
# output: string -> day of week and time
# --rules--
# explicit:
#   Use Ruby Date and Time classes
# examples:
#   delta_minutes value of -4231 produces return value of Thursday 01:29
# algorithm:
#   -set constant for number of minutes in week
#   -set baseline time (using Time class, Time.strptime) to Sunday 00:00:00
#   -take modulo of arg number over num of minutes in week
#   -add that (converted to seconds) to baseline time and return

def calculate_day_and_time(minutes)
  week_delta_minutes = minutes % MINUTES_WEEK
  day_and_time = BASELINE_TIME + week_delta_minutes * SECONDS_IN_MINUTE
  day_and_time.strftime("%A %T")
end


