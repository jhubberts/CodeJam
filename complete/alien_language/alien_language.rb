#!/apollo/env/ruby193/bin/ruby

filename = ARGV[0]
file = File.new( filename )
length, certain, uncertain = file.readline.strip.split.map(&:to_i)
n=0

words = []
certain.times{ words.push(file.readline) }

uncertain.times do
  regex = file.readline.tr('()','[]')
  matches = words.count{|word| /#{regex}/ =~ word}
  puts "Case ##{n;n+=1}: #{matches}"
end
