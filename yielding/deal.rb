# def deal
#     unless block_given?
#         puts "No deal!"
#         return
#     end
#     faces = [ "Jack", "Queen", "King", "Ace" ]
#     suits = [ "Hearts", "Diamonds", "Spades", "Clubs" ]
#     random_face = faces.sample
#     random_suit = suits.sample
#     score = yield random_face, random_suit
#     puts "You scored a #{score}!"
# end

# deal { |face, suit| puts "Dealt a #{face} of #{suit}" }

# deal do |face, suit|
#     puts "Dealt a #{face} of #{suit}"
#     face.length + suit.length
# end

# deal

def deal(number)
    unless block_given?
        puts "No deal!"
        return
    end
    faces = [ "Jack", "Queen", "King", "Ace" ]
    suits = [ "Hearts", "Diamonds", "Spades", "Clubs" ]
    1.upto(number) do |n|
        random_face = faces.sample
        random_suit = suits.sample
        score = yield random_face, random_suit
        puts "You scored a #{score}!"
    end
end

deal(10) do |face, suit|
    puts "Dealt a #{face} of #{suit}"
    face.length + suit.length
end