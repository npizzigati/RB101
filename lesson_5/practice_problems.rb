# Practice Problem 1
# How would you order this array of number strings by descending numeric
# value?

arr = ['10', '11', '9', '7', '8']

# need to map to integers, then sort in reverse order

# the long way:
arr_int = arr.map { |e| e.to_i }
arr_int.sort { |a, b| b <=> a }

# the short way:
arr.map { |e| e.to_i }.sort { |a, b| b <=> a }

# from the answer, the really short way:
arr.sort { |a, b| b.to_i <=> a.to_i }

# Practice problem 2
# How would you order this array of hashes based on the year of publication
# of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez',
   published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# sort a[:published].to_i <=> b[:published].to_i

books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }

# Practice Problem 3
# For each of these collection objects demonstrate how you would reference the
# letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]

# Practice Problem 4
# For each of these collection objects where the value 3 occurs, demonstrate
# how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
# arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
# arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
# hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
# hsh2

# Practice Problem 5
# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family.

munsters.select { |_, v| v['gender'] == 'male' }.inject(0) do |accum, (_, v)|
  accum + v['age']
end

# Practice Problem 6
# One of the most frequently used real-world string properties is that of
# "string substitution", where we take a hard-coded string and modify it with
# various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of
# each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ...like this:

# (Name) is a (age)-year-old (male or female).

munsters.each do |k, v|
  puts "#{k} is a #{v['age']}-year-old #{v['gender']}"
end
