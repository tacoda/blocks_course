cards = ["Jack", "Queen", "King", "Ace", "Joker"]

cards.each { |c| puts c.upcase }

cards.each { |c| puts "#{c.upcase} - #{c.length}"}

cards.shuffle.each { |c| puts "#{c.upcase} - #{c.length}"}

cards.reverse_each { |c| puts c }

scores = {"Larry" => 10, "Moe" => 8, "Curly" => 12}

scores.each do |name, score|
    puts "#{name} scored a #{score}!"
end