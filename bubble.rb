#!/usr/bin/env ruby

def bubble_sort_by(input)
  # Calculate the number of outer iterations and start the outer loop
  outer_iterations = input.length - 1
  outer_iterations.times do |sorted_index|
    # When we push a bubble, it is guaranteed that, at the end of that bubble, the element will be in the correct
    # position. This means that we need to sort the remaining of the array, and safely forget about the just-sorted
    # element and save some unneeded iterations
    inner_iterations = outer_iterations - sorted_index
    # Push the bubble, making the last element of the array to be in the correct position
    inner_iterations.times do |index|
      left_i = index
      left = input[index]
      right_i = index + 1
      right = input[right_i]
    end
  end
  input
end
