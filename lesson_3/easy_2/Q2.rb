# Question 2
# Starting with this string:

# munsters_description = "The Munsters are creepy in a good way."
# Convert the string in the following ways (code will be executed on original munsters_description above):

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

m = "The Munsters are creepy in a good way."

a = [
     m.swapcase,
     m.capitalize,
     m.downcase,
     m.upcase
]

puts a