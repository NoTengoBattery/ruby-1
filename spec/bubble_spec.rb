#!/usr/bin/env ruby

require_relative '../bubble'

RSpec.describe '#bubble_sort_by' do
  it 'sorts words by length' do
    unsorted = %w[aaaa a aaa aa]
    sorted = bubble_sort_by(unsorted) do |left, right|
      left.length - right.length
    end
    expected = %w[a aa aaa aaaa]
    expect(sorted).to eq(expected)
  end
  it 'sorts numbers' do
    unsorted = [1, 65, 23, 0]
    sorted = bubble_sort_by(unsorted) do |left, right|
      left - right
    end
    expected = [0, 1, 23, 65]
    expect(sorted).to eq(expected)
  end
  it 'sorts random numbers' do
    # This is the fire test... it will test if the sort can sort any set of random numbers
    rand(3...10).times do
      unsorted = Array.new(rand(128...1024)) { rand(0...1000) }
      sorted = bubble_sort_by(unsorted) do |left, right|
        right - left
      end
      expected = unsorted.sort_by(&:-@)
      expect(sorted).to eq(expected)
    end
  end
end
