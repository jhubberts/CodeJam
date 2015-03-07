#!/usr/bin/env ruby

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i
n = 0

file.each_line do |line|
  # Represent the number as an array of digits
  num_array = []
  base = 1

  # Maintain a mapping of character to digit mappings
  digit_map = {}
  zero_assigned = false

  # Iterate through each of the digits, look it up in the
  # map, and if it doesn't exist, assign it the min
  # possible value. Since we're going through the number
  # from the largest valued decimal place to the smallest
  # valued one, it makes sense for us to assign the smallest
  # possible values to the earliest digits we see.
  line.strip.each_char do |char|
    if !digit_map[char]
      if zero_assigned or char == line[0]
        digit_map[char] = base
        base += 1
      else
        digit_map[char] = 0
        zero_assigned = true
      end
    end
    num_array.push( digit_map[char] )
  end

  # Total the amount by reversing the digit array, and then
  # keeping a running total
  total = 0
  num_array.reverse!
  num_array.length.times do |index|
    total += num_array[index] * base**index
  end

  puts "Case ##{n;n+=1}: #{total}"
end
