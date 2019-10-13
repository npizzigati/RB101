# Staggered Caps (Part 2)
# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.

# Example:

# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# change in algorithm
# include an "adjustment" counter to add to index on each non-letter iteration
# and when we come to a non-letter, do a next and add one to this adjustment

def staggered_case(string)
  staggered_chars = []
  adj = 0
  string.chars.each_with_index do |char, idx|
    if char !~ /[a-zA-Z]/
      adj += 1
      staggered_chars << char
      next
    end
    if (idx + adj).even?
      staggered_chars << char.upcase(:ascii)
    else
      staggered_chars << char.downcase(:ascii)
    end
  end
  staggered_chars.join
end

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic
# characters should be counted when determining the upper/lowercase state. That
# is, you want a method that can perform the same actions that this method
# does, or operates like the previous version.

# change in algorithm
=begin
use required keyword arg count_all which will accept a boolean
change first conditional to ... && !count_all
=end

def staggered_case2(string, count_all:)
  staggered_chars = []
  adj = 0
  string.chars.each_with_index do |char, idx|
    if !count_all && char !~ /[a-zA-Z]/
      adj += 1
      staggered_chars << char
      next
    end
    if (idx + adj).even?
      staggered_chars << char.upcase(:ascii)
    else
      staggered_chars << char.downcase(:ascii)
    end
  end
  staggered_chars.join
end
