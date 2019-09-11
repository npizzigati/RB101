# How big is the room?
# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# inputs: two strings: length and width of room in meeters
# outputs: area of room, in sqm and sq. ft.

# Alg: Ask the user to enter length l and width w of room in meters. Convert
# inputs to floats and return w * l ( w * l * 10.7639).

CONV_FACTOR = 10.7639
print 'Enter room length in meters:'
l = gets.chomp.to_f
print 'Enter room width in meters:'
w = gets.chomp.to_f
area_in_m = l * w
puts "Room area is #{area_in_m} sqm (#{area_in_m * CONV_FACTOR} sq. ft.)"
