# Counting the Number of Characters
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

# input:

# Please write word or multiple words: walk
# output:

# There are 4 characters in "walk".
# input:

# Please write word or multiple words: walk, don't run
# output:

# There are 13 characters in "walk, don't run".

# Input: String (user-entered)
# Output: Number of characters in string (excluding spaces)
# Algorithm: Ask user for input and validate. Split into array using #chars,
# then count non-spaces using #count. Return count.

def retrieve_string
  input = nil
  loop do
    print "Please enter word or multiple words: "
    input = gets.chomp
    break unless input == "" 

    puts "You must enter something"
  end

  input
end

def count_non_space_chars(string)
  string.chars.count { |e| e != ' '}
end

if __FILE__ == $PROGRAM_NAME
  string = retrieve_string
  chars = count_non_space_chars(string)
  puts "There are #{chars} characters in \"#{string}\""

end
