# Odd Numbers
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on
# separate lines.

# Input: None
# Output: Odd numbers 1..99 on separate lines
# Alg: Iterate through range and print num if odd 

(1..99).each { |num| puts num if num.odd?}
