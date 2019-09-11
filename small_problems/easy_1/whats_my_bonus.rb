# What's my Bonus?
# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the
# bonus should be half of the salary. If the boolean is false, the bonus should
# be 0.

# Examples:

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# inputs: 1 positive integer x, 1 boolean
# outputs: if boolean is true, x/2; if false, 0  

# Algorithm: if boolean = true, return salary/2, else return 0

def calculate_bonus(salary, bonus) 
  return salary / 2 if bonus 
  0
end
