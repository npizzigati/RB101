# Practice Problem 1
# Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

# Method 1: inject
a = flintstones.inject({}) { |accum, e| accum.update(e =>
                                                     flintstones.index(e)) }

# Method 2: each with object
b = flintstones.each_with_object({}) { |e, hash| hash[e] =
                                                 flintstones.index(e) }

# Method 3: plain each
c = {}
flintstones.each { |e| c.update(e => flintstones.index(e)) }


# Method 4: each with index
d = {}
flintstones.each_with_index  { |e, idx| d.update(e => idx) }

puts a
puts b
puts c
puts d
