# How old is Teddy?
# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

# inputs: none 
# outputs: a random number between 20 and 200.
# Alg: return a random number by passing the range 20..200 to rand

# puts "Teddy is #{rand(20..100)} years old!"

# Further Exploration
# Modify this program to ask for a name, and then print the age for that
# person. For an extra challenge, use "Teddy" as the name if no name is
# entered.

# inputs: name
# outputs: name and random number between 20 and 200
# Alg: return a random number by passing the range 20..200 to rand. Print the
# name of the person and the random number

print 'name: '
name = gets.chomp
puts "#{name} is #{rand(20..100)} years old!"

