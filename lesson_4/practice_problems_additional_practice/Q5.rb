# Practice Problem 5
# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

# index
a = flintstones.index { |e| e[0..1] == 'Be' }

puts a
