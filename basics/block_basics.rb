# 3.times do
#     puts "Echo!"
# end

# 3.times { puts "Echo!" }

# 3.times do |number|
#     puts "#{number} Echo!"
# end

# 3.times { |n| puts "#{n} Echo!" }

# 1.upto(3) { |n| puts "#{n} Echo!" }

# 5.times do
#     puts "situp"
#     puts "pushup"
#     puts "chinup"
# end

# 5.times do |n|
#     puts "#{n} situp"
#     puts "#{n} pushup"
#     puts "#{n} chinup"
# end

# 1.upto(5) do |n|
#     puts "#{n} situp"
#     puts "#{n} pushup"
#     puts "#{n} chinup"
# end

# Gotchas
name = "Curly"
number = 100
temp = Math::PI / 4

3.times do |number; temp|
    name = "Moe"
    temp = 98.6
    puts "#{number} Howdy, #{name} is #{temp}!"
end

puts name
puts number
puts temp