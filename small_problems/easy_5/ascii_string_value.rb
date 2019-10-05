# ASCII String Value
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# input: string
# output: integer
# --rules--
# explicit: 1. output integer must be the sum of the ASCII values of every
#           character in the string
#           2. For '' return 0
# data structures: array
# algorithm: loop through the string and build an array of all the ascii
# values. Then return the sum of the array.

# I separated these into functions to play around with Minitest
def ascii_value(string)
  build_value_array(string).sum
end

def char_ascii(char)
  char.ord
end

def build_value_array(string)
  string.chars.each_with_object([]) { |char, arr| arr << char_ascii(char)}
end

# Alternative implementation
def ascii_value_2(string)
  string.chars.inject(0) { |accum, e| accum + e.ord}
end

