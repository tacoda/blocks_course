# 3.times do
#     puts "Running block!"
# end

# def run_my_block
#     puts "Starting method"
#     yield
#     puts "Back in method"
# end

# run_my_block do
#     # puts "Running block"
#     puts "The time is now #{Time.now}"
# end

# If yield is called, there must be an associated block
# Jump Error
# def roll
#     puts "Starting method"
#     yield
#     yield
#     yield
#     puts "Back in method"
# end

# def roll
#     puts "Starting method"
#     yield if block_given?
#     puts "Back in method"
# end

# roll

# roll do
#     number = rand(1..6)
#     puts "You rolled a #{number}"
# end

# Order of arguments for yield is super-important
# def roll
#     puts "Starting method"
#     number = rand(1..6)
#     result = yield "Larry", number
#     # yield "Moe", number
#     puts "The block returned #{result}"
# end

# roll do |name, number|
#     puts "#{name} rolled a #{number}"
#     number * 2
#     "Hello"
#     puts "Hello"
# end

# If too few parameters are passed, excess parameters are set to nil
# If too many parameteres are passed, they're ignored
# def greet
#     yield "Larry", 18
# end

# def greet
#     yield
# end

# greet { |name, age| puts "Hello, #{name}. You don't look #{age}!" }

# def three_times
#     yield 0
#     yield 1
#     yield 2
# end

# def three_times
#     i = 0
#     while i < 3
#         yield i
#         i += 1
#     end
# end

# three_times { |n| puts "#{n} Echo!" }

# def n_times(number)
#     i = 0
#     while i < number
#         yield i
#         i += 1
#     end
# end

# n_times(3) { |n| puts "#{n} Echo!" }
# n_times(10) { |n| puts "#{n} Echo!" }

# class Integer
#     def n_times
#         i = 0
#         while i < self
#             yield i
#             i += 1
#         end
#     end
# end

# 10.n_times { |n| puts "#{n} Echo!" }
# 12.n_times { |n| puts "#{n} Echo!" }

class Array
    def my_each
        i = 0
        while i < self.size
            yield self[i]
            i += 1
        end
        self
    end
end

weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
weekdays.my_each { |day| puts day }
puts weekdays.my_each { |day| puts day }.map { |day| day.upcase }