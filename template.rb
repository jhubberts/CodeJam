#!/usr/bin/env ruby

ROWS_PER_TEST_CASE

filename = ARGV[0]
file = File.new( filename )
num_rows = file.readline

file.each_line.each_slice( ROWS_PER_TESTCASE ) do |raw_testcase|

end
