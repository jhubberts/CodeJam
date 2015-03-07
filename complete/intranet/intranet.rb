#!/usr/bin/env ruby

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i

class Line
  attr_accessor :left,:right

  def initialize(left,right)
    @left = left
    @right = right
  end

  def intersects( line )
    (@left > line.left and @right < line.right) or (@left < line.left and @right > line.right)
  end
end

(1..num_cases).each do |n|
  num_cables = file.readline.to_i
  lines = []
  num_cables.times do 
    left,right = file.readline.split.map(&:to_i)
    lines.push( Line.new(left,right) ) 
  end

  intersections = 0

  while !lines.empty?
    curr = lines.shift
    lines.each do |line|
      intersections += 1 if line.intersects curr
    end
  end

  puts "Case ##{n}: #{intersections}"
end

=begin
PSEUDOCODE:

Build the directory structure as a tree
Put all of the new directories into the tree, but mark their nodes as new
Do a b
=end
