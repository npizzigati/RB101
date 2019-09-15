# Greeting a user
# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the
# user.

# Examples

# What is your name? Bob
# Hello Bob.
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# Inputs: User name -> string; Optional exclamation point after user name.
# Outputs: "Hello <user>." (If no exclam. point) or
# "HELLO <user>. WHY ARE WE SCREAMING." (If exclam. point)
# Algor: Prompt user for name. Validate that something was entered and strip
# extra spaces. If last char is ! print appropriate message in all caps, else
# print message in regular case.

name = nil

loop do
  print 'What is your name? '
  name = gets.strip
  break unless name == ''
  puts 'Please enter a name'
end

if name[-1] == '!'
  puts "HELLO #{name.upcase[0..-2]}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
