# Practice Problem 10
# Given the munsters hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior). Your solution should produce the
# hash below

# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and
# a senior is aged 65+.

def find_age_group(age)
  age_groups = {'kid' => (0..17), 'adult' => (18..64), 'senior' => (65..500)}
  age_groups.detect { |_, range| range === age}.first
end

a = munsters.inject({}) { |accum, (k, v)| accum.update(k => v.update(
                          'age group' => find_age_group(v['age'])))}

puts a

# or, trying to make the inject clearer:

a = munsters.inject({}) do |accum, (k, v)|
  age_group = find_age_group(v['age'])
  accum[k] = v.update('age group' => age_group)
  accum
end

puts a
