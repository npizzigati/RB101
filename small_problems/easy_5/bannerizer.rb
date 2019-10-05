# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.

# input: string (short phrase)
# output: string printed in a box of chars |, + and -
# --rules--
# explicit:
# -input will always fit on screen (single line)
# implicit:
# -there will be a margin of one space on all sides of text
#   - top and bottom lines will always have three lines between them
# -empty string will be 3 vertical spaces surrounded by box
#
# algorithm and data structures: (data structures: strings)
# #create entire box string and then print it#
# - string design:
#   - lines 1 and 5: "+" + (string.size + 2) * "-" + "+"
#   - lines 2 and 4: "|" + (string.size + 2) * " " + "|"
#   - line 3: "|" + " " + string + " " + "|"
# - procedure:
#   - create lines
#   - assemble lines with "\n" to create output string
#   - return output string

def create_boxed_string(string, wrap: false)
  line_1_and_5 = "+" + "-" * (string.size + 2) + "+\n"
  line_2_and_4 = "|" + " " * (string.size + 2) + "|\n"
  middle = create_middle(string, wrap)

  line_1_and_5 + line_2_and_4 + middle + line_2_and_4 + line_1_and_5
end

def truncate(string)
  string[0..75]
end

def create_middle(string, wrap)
  if wrap
    parts = split_string(string)
  elsif string.size > 76
    parts = [truncate(string)]
  else
    parts = [string]
  end
  middle = ''
  parts.each do |part|
    text = (parts.size > 1) ? pad(part) : part # don't pad single line strings
    new_section = "|" + " " + text + " " + "|\n"
    middle += new_section
  end

  middle
end

def print_in_box(box)
  puts create_boxed_string(string)
end

def pad(string)
  string.ljust(77)
end

# Further Exploration
# Modify this method so it will truncate the message if it will be too wide to
# fit inside a standard terminal window (80 columns, including the sides of the
# box). For a real challenge, try word wrapping very long messages so they
# appear on multiple lines, but still within a box.
# See optional argument wrap added to #create_boxed_string -- If not selected will be false

# Wrap:
# input: string longer than 76 chars
# output: same string wrapped at 77th character
# algorithm:
# wrap lines (separate function?):
# - if string.size < 77 return string
# - break at pos 77 (or earlier if there is a word at char 77)
#   - determine char at index 76
#     - if ' '
#       - split string there
#     - else
#       - go back past the first space to the previous char, then index + 1 (first space following)
#       - split string at that point, eliminated all spaces before and after split point
#     - repeat for second half of string
# - create a new middle line for each part of the split string

def split_string(string)
  parts = []
  loop do
    if string.size < 77
      parts << string
      break
    else
      break_index = find_break_index(string)
      parts << string[0..break_index]
      string = string[(break_index + 1)..]
    end
  end
  remove_bookend_spaces(parts)
end

def find_break_index(string)
  return 75 unless string.include?(' ') # return last possible index if no spaces in string
  break_index = 75
  loop do
    if string[break_index] = ' '
      break
    else
      break_index -= 1
    end
  end
  break_index
end

def remove_bookend_spaces(parts)
  parts.map { |string| string.lstrip.rstrip }
end
