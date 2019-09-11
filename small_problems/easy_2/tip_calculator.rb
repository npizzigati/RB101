# Tip calculator
# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# Input: bill amount, tip rate; both entered by user (strings)
# Output: tip amount,  bill amount --> decimals

# Prompt user to enter bill amount and tip rate. Validate each. Print tip (tip
# rate * bill amount and total (tip + bill amount).

require 'bigdecimal'

bill = nil
loop do
  print 'Bill amount: '
  bill = gets.chomp
  if bill =~ /(^\d*\.?\d+$)|(\d+\.?\d*$)/
    bill = bill.to_f
    break
  end
  puts 'Please enter a valid amount.'
end

tip_rate = nil
loop do
  print 'Tip percentage: '
  tip = gets.chomp
  m = tip.match(/(^\d{0,3})%?$/)
  if m
    tip_rate = m[1].to_i
    break
  end
  puts 'Please enter a valid tip'
end

tip = (bill * tip_rate / 100).round(2)
total = bill + tip

printf "The tip is %.2f\n", tip
printf "The total is %.2f\n", total
