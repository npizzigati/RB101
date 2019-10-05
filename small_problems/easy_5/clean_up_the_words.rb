# Clean up the words
# Given a string that consists of some words and an assortment of
# non-alphabetic characters, write a method that returns that string with all
# of the non-alphabetic characters replaced by spaces. If one or more
# non-alphabetic characters occur in a row, you should only have one space in
# the result (the result should never have consecutive spaces).

# Examples:

# cleanup("---what's my +*& line?") == ' what s my line '
# input: String with some words and some non-alphabetic characters
# output: Same string with non-alphabetic characters replaced by spaces
# --rules--
# explicit:
#   - one or more non-alphabetic chars should be replaced by only a single
#   space
# implicit:
#   - Even standard punctuation should be replaced by spaces
# algorithm:
#   1. Use gsub to replace non-alphabetic characters with spaces.

def cleanup(string)
  string.gsub(/[^a-zA-Z]+/, ' ')
end

# Further Exploration
# If you originally wrote this method with regular expressions, try writing
# it without regular expressions.

# algorithm without regex
# map non-alphabetic chars to spaces
# squeeze out extra spaces

  # string.chars.each_with_object([]) { |e, ary|
  #   ary << (('a'..'z') === e.downcase) ? e : ' '}.join(' ').squeeze(' ')

def clean_up2(string)
  clean_ary = []
  string.chars.each.map do |e|
    if ('a'..'z') === e.downcase
      clean_ary << e
    else
      clean_ary << ' '
    end
  end
  clean_ary.join.squeeze(' ')
end
