# def three_times
#     yield
#     yield
#     yield
# end

# three_times { puts "Ho!" }

# def three_times
#     # yield 1
#     # yield 2
#     # yield 3
#     1.upto(3) { |n| yield n }
# end

# three_times do |number|
#     puts "#{number} situp"
#     puts "#{number} pushup"
#     puts "#{number} chinup"
# end

# def n_times(number)
#     1.upto(number) { |n| yield n }
# end

# n_times(5) do |n|
#     puts "#{n} situp"
#     puts "#{n} pushup"
#     puts "#{n} chinup"
# end

# def progress
#     0.step(100, 10) do |n|
#         yield n
#     end
# end

def progress
    0.step(by: 10, to: 100) do |n|
        yield n
    end
end

progress { |percent| puts percent }