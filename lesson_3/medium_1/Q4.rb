# Question 4
# Alyssa was asked to write an implementation of a rolling buffer. Elements are
# added to the rolling buffer and if the buffer becomes full, then new elements
# that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or +
# for modifying the buffer?". Is there a difference between the two, other than
# what operator she chose to use to add an element to the buffer?

# def rolling_buffer1(buffer, max_buffer_size, new_element)
#   buffer << new_element # pushes new_element onto buffer, mutating it
#   buffer.shift if buffer.size > max_buffer_size # shifts an element out the
#                                                 # front if buffer_size is > max
#   buffer
# end

# def rolling_buffer2(input_array, max_buffer_size, new_element)
#   buffer = input_array + [new_element] # Creates a new array with old array
#                                        # plus new element
#   buffer.shift if buffer.size > max_buffer_size # dumps an elem if necessary
#   buffer
# end

# There is no difference in function, although I think the second one would be
# slightly slower. The first mutates the buffer, the second creates a new
# buffer each time.

# AND, from the official answer, the fact that the first one mutates the
# caller, does mean there's a difference in function (the mutated caller in the
# first case and not in the second). What is the same is the return value.
