# Our countdown to launch isn't behaving as expected. Why? Change the code
# so that our program successfully counts down from 10 to 1.
TOP = 10

def decrease(counter)
  counter - 1
end

counter = TOP

TOP.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
