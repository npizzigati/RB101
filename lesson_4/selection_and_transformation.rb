# Let's now take a look at an example with hashes. In this example we want to
# select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# How would you implement a method like this?

# Using a loop:
# Initialize empty fruit hash. Use keys method to produce an array of keys.
# Loop through each key. If value is 'Fruit', add to fruit hash. Stop loop when
# counter = keys array size

def select_fruit(produce)
  fruit = {}
  keys = produce.keys
  cnt = 0
  number_of_keys = produce.keys.size
  while cnt < number_of_keys
    current_key = keys[cnt]
    current_type = produce[current_key]
    fruit[current_key] = current_type if current_type == 'Fruit'
    cnt += 1
  end
  fruit
end

puts select_fruit(produce)

# Using a hash method
# Use select
def select_fruit2(produce)
  produce.select { |k, v| v == 'Fruit'}
end

puts select_fruit2(produce)

# MUTATING DOUBLE NUMBERS
# We can invoke the method like this.

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
# Note that the double_numbers method returned a new array with every element doubled, and that the original array is not mutated. In other words, my_numbers is still [1, 4, 3, 7, 2, 6]. This isn't a requirement, but just a consequence of how we implemented the method.

# If we wanted to, we could've easily decided that mutating the method argument is the right approach. Can you implement a double_numbers! method that mutates its argument?

# Try coding a solution in a code file or irb and then check the answer:
# Using a loop
def double_numbers!(numbers) # numbers is an array
  cnt = 0
  numbers.size
  while cnt < numbers.size
    numbers[cnt] *= 2
    cnt += 1
  end
end

# DOUBLE ODD NUMBERS BASED ON POSITION IN ARRAY
# We previously said that transformation is an operation that is performed on
# every element in the collection. In the next example, we'll study a method
# that only transforms a subset of the elements in the collection. Here, we
# only multiply by 2 if the value is odd. The if condition will only evaluate
# to true if current_number is odd (we check this using Integer#odd?).

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if current_number.odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end
# Once again, note that we are working with a method that does not mutate its argument and instead returns a new array. We can call it like so:

# my_numbers = [1, 4, 3, 7, 2, 6]
# double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# # not mutated
# my_numbers                      # => [1, 4, 3, 7, 2, 6]

# Exercise for the reader: What if we wanted to transform the numbers based on
# their position in the array rather than their value?

# using loop
def double_odd_indexed_numbers(numbers)
  cnt = 0
  size = numbers.size
  odd_indexed_numbers = []

  while cnt < size
    if cnt.odd?
      odd_indexed_numbers << numbers(cnt) * 2
    else
      odd_indexed_numbers << numbers(cnt)
    end
    cnt += 1
  end

  odd_indexed_numbers
end

# MODIFICATION OF #double_numbers to take a user-specified multiplier
def double_numbers!(numbers, factor) # numbers is an array
  cnt = 0
  numbers.size
  while cnt < numbers.size
    numbers[cnt] *= factor
    cnt += 1
  end
end
