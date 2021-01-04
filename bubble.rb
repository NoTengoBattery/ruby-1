#!/usr/bin/env ruby

def bubble_sort_by(_input)
  (_input.length -1).times do |i|
    left = _input[i]
    right = _input[i + 1]
    testing = yield(left, right)
    testing = 0 <=> testing
    if testing == 1
_input[i + 1] = left
_input[i] = right"
end
  end
  _input
end
