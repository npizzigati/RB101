# Madlibs
# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

# Example

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

=begin

input: a noun, verb, adjective and adverb, entered through stdin
output: a short story using the words entered by the user

rules:
explicit:
NA
implicit:
NA
questions: input validation?

algorithm and data structures:

set story string using the format named parameters %{}
prompt user for noun, verb, adjective and adverb
validate that user did not enter empty string for each
output story with substituted values

madlib string: "I would like to %{verb} a %{adj} %{noun} %{adv}"

=end


def obtain_input
  words = {}
  pos = [:noun, :verb, :adj, :adv]
  pos.size.times do |idx|
    input = ''
    loop do
      print "Enter a #{pos[idx].to_s}: "
      break if (input = gets.chomp) != ''
      puts 'You must enter something'
    end
    words[pos[idx]] = input
  end
  words
end

def create_madlib(words)
  madlib = 'I would like to %{verb} a %{adj} %{noun} %{adv}.'
  format(madlib, words)
end

def madlib
  words = obtain_input
  puts create_madlib(words)
end

if __FILE__ == $PROGRAM_NAME
  madlib
end
