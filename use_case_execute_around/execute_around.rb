# start_time = Time.now

# sleep(0.5)

# elapsed_time = Time.now - start_time
# puts "It took #{elapsed_time} seconds"

# def time_it(label)
#     start_time = Time.now
#     yield
#     elapsed_time = Time.now - start_time
#     puts "#{label} took #{elapsed_time} seconds"
# end

# time_it("Sleepy code") do
#     sleep(0.5)
# end

# require 'benchmark'

# elapsed_time = Benchmark.realtime do
#   # run some code
#   sleep(1)
# end

# puts "It took #{elapsed_time}"

require 'benchmark'

def time_it(label)
    elapsed_time = Benchmark.realtime { yield }
    puts "#{label} took #{elapsed_time} seconds"
end

time_it("Sleepy code") do
    sleep(1)
end