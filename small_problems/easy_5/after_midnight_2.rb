# After Midnight (Part 2)
# As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is
# positive, the time is after midnight. If the number of minutes is negative,
# the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Examples:

# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0
# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us,
# though; it makes the problem more interesting.

# Disregard Daylight Savings and Standard Time and other irregularities.

# input: time of day in 24 hr format
# output: integer - number of minutes before and after midnight (two separate
# returns)
# --rules--
# explicit:
#   - if number of minutes is positive time is after midnight, negative =
#   before midnight
#   - value should be in range 0..1439
#   - may not use Date and Time methods
#   - accept '24:00' as a valid input
# data structures: hash for extracted hours and min: {hours: 2, minutes: 30}
# algorithm
#      - parse string into hours and minutes using regex
#      - mutliply hours by 60 and add to minutes to get hours after midnight
#      - subtract from 1440 to get hours before midnight (return with - sign)
#

require 'time'

MIDNIGHT = Time.strptime('00:00', "%R")

def extract_hours_and_minutes(string)
  m = string.match(/^(\d{2}):(\d{2})$/)
  {hours: m[1].to_i, minutes: m[2].to_i}
end

def convert_to_integer(hours_and_minutes)
  hours_and_minutes[:hours] * 60 + hours_and_minutes[:minutes]
end

def after_midnight(string)
  return 0 if ['00:00', '24:00'].include?(string)
  hours_and_minutes = extract_hours_and_minutes(string)
  convert_to_integer(hours_and_minutes)
end

def before_midnight(string)
  return 0 if ['00:00', '24:00'].include?(string)
  minutes_after_midnight = after_midnight(string)
  (1440 - minutes_after_midnight)
end

# Further exploration
# How would these methods change if you were allowed to use the Date and Time
# classes?
# algorithm:
# 1. Create time constant for midnight using strptime
# 2. Parse time into time object using Time.strptime
# 3. Find delta between midnight constant and new time object by subtracting. Result will be in seconds.
# 4. Multiply second by 60 to get minutes
# 5. Subtract from 1440 to get time before midnight
# Note: I'm leaving out edge cases here... just concentrating on the main idea
def after_midnight_v2(string)
  user_time = Time.strptime(string, "%R")
  time_in_seconds = -(MIDNIGHT - user_time).to_i
  time_in_seconds / 60
end

def before_midnight_v2(string)
  time_after_midnight = after_midnight_v2(string)
  -(0 - time_after_midnight)
end
