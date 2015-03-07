#!/apollo/env/ruby193/bin/ruby
# Google Code Jam problem to get cookies

STARTING_COOKIE_RATE = 2.0;

# C is the number of cookies required to buy a farm

def get_min_time(farm_price,farm_gain_rate,target)
  # The time that has elapsed so far
  time_elapsed = 0.0
  cookie_rate = STARTING_COOKIE_RATE
  current_cookies = 0

  while current_cookies < target do
    time_to_completion = get_time_to_completion(cookie_rate,current_cookies,target)
    time_to_factory = get_time_to_completion(cookie_rate,current_cookies,farm_price) 

    # If you'll win before you have to make your next decision,
    # just win!
    if time_to_completion <= time_to_factory
      return time_elapsed + time_to_completion
    end

    return "I have absolutely no idea"
  end

  puts farm_price
  puts farm_gain_rate
  puts target
end

# Returns the number of seconds until the specified
# number of cookies have been acquired
def get_time_to_completion(rate,current,target)
  diff = target - current
  return diff >= 0.0 && rate > 0.0 ? diff/rate : 0.0
end

def really_dirty_solution(c,f,x)
  past_time = x/STARTING_COOKIE_RATE
  number_of_farms = 1

  while number_of_farms < 10000000
    t = x/(STARTING_COOKIE_RATE + number_of_farms * f)
    (1..number_of_farms).each do |n|
      t += c/(STARTING_COOKIE_RATE + (f * (n - 1)))
    end

    if t > past_time
      break
    else
      number_of_farms += 1
      past_time = t
    end
  end

  past_time
end

# Input file
f = File.new( ARGV[0] )

numcases = f.readline
n = 0

f.each_line do |raw_input|
  c,f,x = raw_input.split.collect{|n| n.to_f}
  puts "Case ##{n; n+=1}: #{really_dirty_solution(c,f,x)}"
end
