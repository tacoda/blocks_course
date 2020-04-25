scores = [83, 71, 92, 64, 98, 87, 75, 69]

puts scores.select { |s| s > 80 }
puts scores.reject { |s| s > 80 }
puts scores.any? { |s| s < 70 }
puts scores.detect { |s| s < 70 }

scores_doubled = scores.map { |s| s * 2 }
puts scores.reduce(:+)
evens, odds = scores.partition { |s| s.even? }
p evens
p odds