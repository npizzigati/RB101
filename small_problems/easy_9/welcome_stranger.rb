# Welcome Stranger
# Create a method that takes 2 arguments, an array and a hash. The array will
# contain 2 or more elements that, when combined with adjoining spaces, will
# produce a person's name. The hash will contain two keys, :title and
# :occupation, and the appropriate values. Your method should return a greeting
# that uses the person's full name, and mentions the person's title.

# Example:

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

=begin
input: array containing two or more elements, representing person's name,
  hash containing two keys, :title and :occupation, and the appropriate
  values)
output: greeting using the persons full name that mentions person's title

rules: see example for format of input and output

algorithm:
assemble name
assemble title and occupation
return greeting
=end

def greetings(arr, hsh)
  name = arr.join(' ')
  title = hsh.values.join(' ')
  "Hello, #{name}! Nice to have a #{title} around."
end
