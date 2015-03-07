#!/apollo/env/ruby193/bin/ruby
# Google Code Jam problem to get cookies

BLANK = '.'
BLUE = 'B'
RED = 'R'

def determine_winner(board,connect)
  
end

unless ARGV[0]
  puts "A valid filename is required!"
  exit 1
end

f = File.new( ARGV[0] )

numcases = f.readline.to_i
(1..numcases).each do |n|
  boardsize,connect = f.readline.strip.split.map(&:to_i)

  board = []
  boardsize.times{ board.push(f.readline.strip.split('')) }

  board.each do |row|
    row.delete(".")
    puts boardsize - row.length
    (boardsize - row.length).times {row.unshift(".")} 
  end

  puts "Case ##{n}: #{determine_winner(board,connect)}"
end
