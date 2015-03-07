#!/usr/bin/env ruby

f = File.new( ARGV[0] )

num_lines = f.readline
n = 0

f.each_line do |raw_line|
  puts "Case ##{n;n+=1}: #{raw_line.split.reverse.join(' ')}"
end
