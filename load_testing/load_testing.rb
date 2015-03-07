#!/usr/bin/env ruby

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i

(1..num_cases).each do |n|
  num_cables = file.readline.to_i
  load_test
  puts "Case ##{n}: #{load_test}"
end

=begin
PSEUDOCODE:

Build the directory structure as a tree
Put all of the new directories into the tree, but mark their nodes as new
Do a b
=end
