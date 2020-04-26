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

module MyEnumerable
    def my_select
        result = []
        each do |value|
            result << value if yield(value)
        end
        result
    end

    def my_map
        result = []
        each do |value|
            result << yield(value)
        end
        result
    end
end

class MovieQueue
    include MyEnumerable

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
    
    def each_by_rating(rating)
        @movies.select { |m| m.rating == rating }
                .each { |m| yield m }
    end
end

movie1 = Movie.new("Toy Story", "G", 81)
movie2 = Movie.new("Cast Away", "PG", 143)
movie3 = Movie.new("Apollo 13", "PG", 140)
movie4 = Movie.new("Cars", "G", 117)

queue = MovieQueue.new("Friday Night")
queue.add_movie(movie1)
queue.add_movie(movie2)
queue.add_movie(movie3)

p queue.my_select { |m| m.duration > 100 }

p queue.my_map { |m| m.title.downcase }