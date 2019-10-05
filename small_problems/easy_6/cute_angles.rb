=begin
Cute angles
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
Note: your results may differ slightly depending on how you round values, but
should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

***
input: float (representing angle) between 0 and 360
output: string representing angle in degrees, minutes and seconds
--rules--
-explicit
-- use ° for degrees, ' for minutes, and " for seconds.
-- results my differ slighly depending on rounding, but should be within a second or two
-- use leading spaces for minutes and seconds, to two digits
-implicit
-- result for 360 may be 360°00'00" or 0°00'00"

*ALGORITHM*
do seconds = seconds % sec_in_min(60) * min_in_deg(60) * max degrees(360)
quotient, seconds = seconds.divmod(60)
degrees, minutes = quotient.divmod(60)

1. Set constants
  a. SECONDS_IN_MINUTE = 60
  b. MINUTES_IN_DEGREE = 60
2. Set seconds_in_degree = SECONDS_IN_MINUTE * MINUTES_IN_DEGREE
3. Set seconds = degrees * seconds_in_degree
4. set quotient, seconds = seconds.divmod(SECONDS_IN_MINUTE)
5. set degree, minutes = quotient.divmod(MINUTES_IN_DEGREE)
6. Use format to return formatted string: format("%d°%02d'%02d\"", 5, 5, 5)

=end

SECONDS_IN_MINUTE = 60
MINUTES_IN_DEGREE = 60

def dms(deg_float)
  seconds_in_degree = SECONDS_IN_MINUTE * MINUTES_IN_DEGREE
  seconds = deg_float * seconds_in_degree
  quotient, seconds = seconds.divmod(SECONDS_IN_MINUTE)
  degrees, minutes = quotient.divmod(MINUTES_IN_DEGREE)
  format("%d°%02d'%02d\"", degrees, minutes, seconds)
end

=begin
Further Exploration
Our solution returns the following results for inputs outside the range 0-360:

dms(400) == %(400°00'00")
dms(-40) == %(-40°00'00")
dms(-420) == %(-420°00'00")
Since degrees are normally restricted to the range 0-360, can you modify the
code so it returns a value in the appropriate range when the input is less than
0 or greater than 360?

dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")

ANSWER: angle = angle % 360
=end
