class Flyer
    attr_reader :name, :email, :miles_flown

    def initialize(name, email, miles_flown)
        @name = name
        @email = email
        @miles_flown = miles_flown
    end

    def to_s
        "#{name} (#{email}): #{miles_flown}"
    end
end

flyers = []

1.upto(5) do |n|
    flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", n * 1000)
end

puts flyers

flyers.each { |f| puts f }

total = 0
flyers.each { |f| total += f.miles_flown }
puts "Total miles flown: #{total}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }

promotions.each do |name, multiplier|
    puts "Earn #{multiplier}x miles by flying #{name}!"
end

flyers.each do |flyer|
    promotions.each do |name, multiplier|
        puts "#{flyer.name} could earn #{flyer.miles_flown * multiplier} miles by flying #{name}!"
    end
end