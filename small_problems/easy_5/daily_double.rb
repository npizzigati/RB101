# ddaaiillyy ddoouubbllee
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze
# or String#squeeze!.

# Examples:
=begin
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end

# input: string
# output: new string with consecutive dups collapsed into single char
# --rules--
# explicit:
# - cannot use String#squeeze
# implicit:
# - NA
#
# algorithm and data structures:
# 1. split string into with_dups array using chars
# 2. initialize empty dups_removed array
# 3. iterate through with_dups (each with index)
#    a. at each index, add letter to dups_removed array if letter is not dup
#       of previous letter
# 4. join dups_removed and return

def crunch(string)
  dups_removed = []
  string.chars.each do |char|
    dups_removed << char if dups_removed.last != char
  end
  dups_removed.join
end
