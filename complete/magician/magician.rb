#!/apollo/env/ruby193/bin/ruby

class MagicianTestCase
  EXPECTED_LINES = 10
  BAD_MAGICIAN = "Bad magician!"
  VOLUNTEER_CHEATED = "Volunteer cheated!"

  def initialize( raw_lines )
    if raw_lines.length == EXPECTED_LINES
      @first_row = raw_lines[0].to_i - 1
      @first_grid = raw_lines[1..4].collect{|line| line.split(' ').map(&:to_i)}
      @second_row = raw_lines[5].to_i - 1
      @second_grid = raw_lines[6..9].collect{|line| line.split(' ').map(&:to_i)}
      @possible_values = Array(1..16)
    end
  end

  def simulate
    @possible_values.select!{ |n| (@first_grid[@first_row].include? n) and (@second_grid[@second_row].include? n) }

    if @possible_values.length == 0
      VOLUNTEER_CHEATED
    elsif @possible_values.length == 1
      @possible_values[0].to_s
    else
      BAD_MAGICIAN
    end
  end
end

filename = ARGV[0]
in_file = File.new( filename )
num_cases = in_file.readline.to_i
n = 0;

in_file.each_line.each_slice(10) do |raw_test_case|
  puts "Case ##{n; n += 1}: #{MagicianTestCase.new(raw_test_case).simulate}"
end
