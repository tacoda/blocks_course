class Flyer
    attr_reader :name, :email, :miles_flown
    attr_accessor :status

    def initialize(name, email, miles_flown, status=:bronze)
        @name = name
        @email = email
        @miles_flown = miles_flown
        @status = status
    end

    def to_s
        "#{name} (#{email}): #{miles_flown} - #{status}"
    end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)

puts flyers.select { |f| f.miles_flown >= 3000 }
puts flyers.reject { |f| f.miles_flown >= 3000 }
puts flyers.any? { |f| f.status == :platinum }
puts flyers.detect { |f| f.status == :bronze }

p flyers.partition { |f| f.status == :platinum }
puts flyers.map { |f| "#{f.name.capitalize} (#{f.status.upcase})" }
puts flyers.map { |f| f.miles_flown * 1.6 }.reduce(:+)

puts flyers.select { |f| f.status == :bronze }
            .map { |f| f.miles_flown * 1.6 }
            .reduce(:+)

puts flyers.max_by { |f| f.miles_flown }
puts flyers.min_by { |f| f.miles_flown }
