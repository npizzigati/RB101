# Madlibs Revisited
# Let's build another program using madlibs. We made a program like this in the
# easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have
# created, and then plugs in a selection of randomized nouns, verbs, adjectives,
# and adverbs into that text and prints it. You can build your lists of nouns,
# verbs, adjectives, and adverbs directly into your program, but the text data
# should come from a file or other external source. Your program should read
# this text, and for each line, it should place random words of the appropriate
# types into the text, and print the result.

# The challenge of this program isn't about writing your program; it's about
# choosing how to represent your data. Choose the right way to structure your
# data, and this problem becomes a whole lot easier. This is why we don't show
# you what the input data looks like; the input representation is your
# responsibility.

# Example output:

# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

=begin

problem
*******

input: string from a text file
output: string

rules
-----

explicit: - Placeholders in the target text should be replaced by the indicated
            type of word, chosen at random from a list of words.
implicit: - NA

questions: - Validation of input file text? I will assume not.

examples
********
See above

data structures
***************
- array of strings for story (each line or paragraph is a separate element in
the array), with placeholders for words in the form {}
- array for each word type, e.g. verbs = %w(go, run, see)
- hash created for word types appearing in story (key = word type; value = array
of words selected at random, one for each instance that the word appears in the text)

algorithm
*********
- Create arrays for each word type, with the possible words to be selected at random.
- Load file into another array 'story'.
- Extract "blanks" from text in array 'story' (e.g. noun, plural_noun, adjective) into
an array using #scan.
- Map array to randomly selected words from the correct category.
- Replace instances of {word} in story with %s.
- Call #format method on each string of story, using the array of randomly
selected words.
- Print story strings.

=end
CHOICES = {'ing_verb' => %w(going eating sleeping crying),
           'adjective' => %w(smelly beautiful awful infected),
           'noun' => %w(cat toenail fungus television),
           'plural_noun' => %w(guitar\ strings cheeses pastas mountains),
           'game' => %w(chess American\ football truth\ or\ dare backgammon),
           'plant' => %w(marigold orange\ tree seaweed poison\ ivy),
           'body_part' => %w(armpit kneecap kidney nose),
           'place' => %w(France Guanajuato Kensington corner\ store),
           'number' => [2, 3, 4, 320]}

def populate_story_array
  story = []
  path = File.join(__dir__, '/resources/madlib_text.txt')
  File.open(path) do |f|
    f.each do |line|
      story << line
    end
  end
  story
end

def extract_blanks(story)
  blanks = []
  story.each do |paragraph|
    blanks += paragraph.scan(/{(.+?)}/)
  end
  blanks.flatten
end

def map_blanks(blanks)
  blanks.map { |blank| CHOICES[blank].sample }
end

def replace_blanks_with_format_placeholder(story)
  story_with_placeholders = []
  story.each do |paragraph|
    story_with_placeholders << paragraph.gsub(/{.+?}/, '%s')
  end
  story_with_placeholders
end

def insert_replacement_words(story, replacements)
  story_with_replacements = []
  story.each do |paragraph|
    story_with_replacements << paragraph % replacements
  end
  story_with_replacements
end

def show(story)
  story.each { |paragraph| puts paragraph }
end

def madlibs
  story = populate_story_array
  blanks = extract_blanks(story)
  replacements = map_blanks(blanks)
  story_with_placeholders = replace_blanks_with_format_placeholder(story)
  final_story = insert_replacement_words(story_with_placeholders, replacements)
  show(final_story)
end
