class Movie
    attr_reader :title, :rating, :duration

    def initialize(title, rating, duration)
        @title = title
        @rating = rating
        @duration = duration
    end

    def watch
        puts "Watching #{title} - #{rating} (#{duration} mins)..."
    end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Cast Away", "PG", 143)
movie3 = Movie.new("Apollo 13", "PG", 140)
movie4 = Movie.new("Cars", "G", 117)

class MovieQueue
    include Enumerable

    def initialize(name)
        @name = name
        @movies = []
    end

    def add_movie(movie)
        @movies << movie
    end

    def each
        @movies.each { |m| yield m }
    end

    # def each_pg_movie
    #     @movies.select { |m| m.rating == "PG" }
    #             .each { |m| yield m }
    # end
    
    def each_by_rating(rating)
        @movies.select { |m| m.rating == rating }
                .each { |m| yield m }
    end
end

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

# Name your most common iterator in a class `each`
# By defining each, you get all of Enumerable for free
queue.each { |movie| movie.watch }

# queue.each_pg_movie do |movie|
#     # puts movie.title
#     movie.watch
# end

queue.each_by_rating('PG') { |movie| movie.watch }
queue.each_by_rating('G') { |movie| movie.watch }

p queue.select { |m| m.duration > 100 }

p queue.detect { |m| m.title =~ /13/ }