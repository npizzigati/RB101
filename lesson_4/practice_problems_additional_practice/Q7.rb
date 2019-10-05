# Practice Problem 7
# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"
# ex:

# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letters = statement.chars
freq = {}
letters.each do |letter|
  freq[letter] = freq.fetch(letter, 0) + 1
end

p freq

# Attempt to do in a one- or two-liner

b = statement.chars.each_with_object({}) { |letter, freq_hash| freq_hash[letter] =
                                      freq_hash.fetch(letter, 0) + 1 }

puts b
