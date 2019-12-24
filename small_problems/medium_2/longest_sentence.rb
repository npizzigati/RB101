# Longest Sentence

# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.

=begin
input: text file
output: string
rules:
explicit: -Output sentence will be the longest sentence in the file, based on
          number of words.
          -Sentences may end with '.', '?' or '!'.
          -Sequences of characters that are not sentence ending characters
           should be treated as words.
          -Also print number of words in longest sentence
implicit: NA

questions: -What if two sentences are the same length? (I assume I should choose
           the first)
           -Should new line characters be ignored for the purposes of counting
           sentence words? E.g., if there is a new line in the middle of a
           sentence? I will assume new lines should be elimiated, since the
           sample text is full of new lines in the middle of sentences..
           -Should there be error handling if the file is not found? I will
           assume not.

algorithm: -open file
           -Loop over file lines (This will give paragraphs separated by a
           new line character)
             -Split each line (paragraph) on sentence terminating characters
             using split with regex
             -In a separate method, count all words in each sentence
=end

DEFAULT_PATH = File.expand_path('~/launch_school/RB101/small_problems/medium_2/resources/longest1.txt')

def obtain_path_from_user
  puts "Enter path of text file (enter for #{DEFAULT_PATH})"
  input = gets.chomp
  return DEFAULT_PATH if input == ''
end

def split_text_into_sentences(text)
  text.split(/(?<=[.\?!]) /)
end

def find_longest_sentence(text)
  sentences = split_text_into_sentences(text)
  longest_sentence = nil
  longest_sentence_count = 0
  sentences.each do |sentence|
    sentence_count = count_words(sentence)
    if sentence_count > longest_sentence_count
      longest_sentence = sentence
      longest_sentence_count = sentence_count
    end
  end
  longest_sentence
end

def count_words(sentence)
  sentence.split.length
end

def retrieve_text_from_path(path)
  text = ''
  File.open(path, 'r') do |f|
    f.each do |line|
      text << line
    end
  end
  text
end

def longest_sentence
  path = obtain_path_from_user
  text = retrieve_text_from_path(path)
  longest_sentence = find_longest_sentence(text)
  puts "Longest sentence (#{count_words(longest_sentence)} words):" \
       "\n\n#{longest_sentence}"
end
