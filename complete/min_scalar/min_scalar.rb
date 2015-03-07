#!/usr/bin/env ruby

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i
n = 0

file.each_line.each_slice(3) do |raw_input|
  x = raw_input[1].strip.split.map(&:to_i).sort
  y = raw_input[2].strip.split.map(&:to_i).sort.reverse
  total = 0
  x.length.times {|idx| total+=x[idx]*y[idx]}
  puts "Case ##{n;n+=1}: #{total}"
end
