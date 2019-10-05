Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }

# min
ages.values.min

# inject
ages.inject(1000) { |memo, (name, age) | age < memo ? age : memo }
