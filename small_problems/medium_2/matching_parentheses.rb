# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Examples:

# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).

=begin
problem
*******
input: string
output: boolean

rules
-----
explicit: - return true if all parentheses in input string are balanced,
            false otherwise
          - balanced pairs must start with an opening parenthesis
implicit: - only test matching parentheses, not other brackets

examples
********
see provided test cases

data structures and algorithm
*****************************
Make a stack using an array. Iterate over string. Push each opening parenthesis found onto the
array. Pop off a parenthesis for each closing parenthesis. If pop ever returns
nil, parentheses are not balanced and method should return false.
=end
require 'pry'

def balanced?(string)
  stack = []
  string.chars.each do |char|
    stack << char if char == '('
    if char == ')'
      return false if stack.pop.nil?
    end
  end
  return false unless stack.empty?

  true
end

def all_brackets_balanced?(string)
  stacks = Hash.new(0)
  openers = { parens: '(', square: '[', curly: '{' }
  closers = { parens: ')', square: ']', curly: '}' }
  quotes = { single: "'", double: '"' }
  string.chars.each do |char|
    if openers.value?(char)
      key = openers.rassoc(char).first
      stacks[key] += 1
    elsif closers.value?(char)
      key = closers.rassoc(char).first
      stacks[key] -= 1
    elsif quotes.value?(char)
      key = quotes.rassoc(char).first
      stacks[key] = (stacks[key] + 1) % 2
    end
  end
  stacks.all? { |(_k, v)| v == 0 }
end
