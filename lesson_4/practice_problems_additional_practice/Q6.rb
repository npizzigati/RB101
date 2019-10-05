# Practice Problem 6
# Amend this array so that the names are all shortened to just the first three
# characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# map
a = flintstones.map { |e| e[0, 3] }

puts a

# each_with_object
b = flintstones.each_with_object([]) { |e, arr| arr << e[0, 3] }

puts b

# inject
c = flintstones.inject([]) { |accum, e| accum << e[0, 3] }

puts c
