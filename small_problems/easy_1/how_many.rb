# How Many?
# Write a method that counts the number of occurrences of each element in a given array.
# 
# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
# 
# count_occurrences(vehicles)
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted,
# print each element alongside the number of occurrences.
# 
# Expected output:
# 
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# inputs: an array of strings
# outputs: print "vehicle => occurrences\n" for each element in array  
# Questions: What if there are no elements in array? I assume we output a message.

# Ex / Test cases
# see above
# vehicles = {} will print "No vehicles."

# Data Structures / Algorithm
# Output in a hash with each vehicle as a symbol
# If there are no vehicles, print "No vehicles" and return. If there are,
# create empty hash. Iterate through each vehicle in the array. Check to see if
# vehicle is already in hash, if so, add one to its count. If not, create a
# hash entry with the key being the vehicle name and the value 1.
# To print, iterate through the hash, printing the key and value, separated by a hash rocket  


def how_many?(vehicles)
  return 'No vehicles' if vehicles.empty?
  counts = {}
  vehicles.each do |vehicle| 
    if counts.include?(vehicle)
      counts[vehicle] += 1
    else 
      counts[vehicle] = 1
    end
  end
  print_counts(counts)
end

def print_counts(counts)
  puts 'The counts are:'
  counts.each { |k, v| puts "#{k} => #{v}"} 
end
