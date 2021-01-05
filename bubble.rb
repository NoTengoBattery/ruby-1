#!/usr/bin/env ruby
def bubble_sort(input)
  outer_iterations = input.length - 1
  outer_iterations.times do |sorted_index|
    inner_iterations = outer_iterations - sorted_index
    inner_iterations.times do |num|
      if input[num] > input[num+1]
        input[num], input[num+1] = input[num+1], input[num]
      end
    end
  end
  input
end

def bubble_sort_by(input)
  # Calculate the number of outer iterations and start the outer loop
  outer_iterations = input.length - 1
  outer_iterations.times do |sorted_index|
    # When we push a bubble, it is guaranteed that, at the end of that bubble, the element will be in the correct
    # position
    # This means that we need to sort the remaining of the array, and safely forget about the just-sorted element to
    # save some unneeded iterations
    inner_iterations = outer_iterations - sorted_index
    # Push the bubble, making the last element of the array to be in the correct position
    inner_iterations.times do |index|
      left_i = index
      left = input[index]
      right_i = index + 1
      right = input[right_i]
      # Here two thing happen:
      #  1. Call the block from the "user" to do the customized comparison
      #  2. Squash the result from yield (which can be any number) to 1, 0 or -1 using the spaceship operation
      compared = 0 <=> yield(left, right)
      # The condition here is that when we have a negative number, we need to swap the elements in the array
      if compared == -1
        input[left_i] = right
        input[right_i] = left
      end
    end
  end
  input
end
