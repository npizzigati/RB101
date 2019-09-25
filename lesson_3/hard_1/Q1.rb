# Practice Problems: Hard 1
# Question 1
# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = “hello world”
end

greeting

# Answer: I expect to get an error message about an undefined variable
# But I'm wrong. That value will be nil, since greeting is initialized in the
# if block, even though the block doesn't get executed
