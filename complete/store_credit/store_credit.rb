#!/usr/bin/env ruby

filename = ARGV[0]
file = File.new( filename )
num_cases = file.readline.to_i

n = 0
file.each_line.each_slice(3) do |raw_slice|
  store_credit = raw_slice[0].to_i
  items = raw_slice[2].split.map(&:to_i)
  indexes = []
  (1...items.length).each do |n|
    (n+1..items.length).each do |m|
      total = items[n-1] + items[m-1]
      indexes = [n,m] if total == store_credit
    end
  end

  puts "Case ##{n;n+=1}: #{indexes.join(' ')}"
end
