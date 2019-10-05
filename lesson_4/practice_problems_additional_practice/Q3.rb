# Practice Problem 3
# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# throw out the really old people (age 100 or older).

# select
ages.select { |_, v| v < 100 }

# each_with_object
ages.each_with_object({}) { |(k, v), hash| hash[k] = v if v < 100}
