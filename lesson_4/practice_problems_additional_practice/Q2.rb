# Practice Problem 2
# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
         "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


# Method 1 - inject

a = ages.inject(0) { |accum, (_, v)| accum + v}
# or
b = ages.values.inject(:+)

puts a, b

# Method 2 - sum
c = ages.values.sum

puts c

# Method 3 - each
d = 0
ages.each { |k, v| d += v }

puts d
