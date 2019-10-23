# Name Swapping
# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.

# Examples

# swap_name('Joe Roberts') == 'Roberts, Joe'

=begin
input: string containing first and last name, separated by space
output: string containing last name, first name
rules:
explicit:
see input and output
implicit:
NA
algorithm:
split stringm then reverse, then join with comma and space.
=end

def swap_name(name)
  name.split.reverse.join(', ')
end
