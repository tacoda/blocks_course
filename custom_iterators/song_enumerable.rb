class Song
    attr_reader :name, :artist, :duration

    def initialize(name, artist, duration)
        @name = name
        @artist = artist
        @duration = duration
    end

    def play
        puts "Playing '#{name}' by #{artist} (#{duration} mins)...'"
    end

    def each_filename
        %w(mp3 wav aac).each do |format|
            yield construct_filename.concat(".#{format}")
        end
    end

    def construct_filename
        "#{name.downcase.gsub(' ', '-')}-#{artist.downcase}"
    end

    def to_s
        "#{name} by #{artist}"
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

    def my_reject
        result = []
        each do |value|
            result << value unless yield(value)
        end
        result
    end

    def my_detect
        each do |value|
            return value if yield(value)
        end
        nil
    end

    def my_any?
        each do |value|
            return true if yield(value)
        end
        false
    end

    def my_reduce(acc=0)
        each do |value|
            acc = yield(acc, value)
        end
        acc
    end
end

class Playlist
    include MyEnumerable

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        @songs << song
    end

    def each
        @songs.each { |s| yield s }
    end

    def play_songs
        each { |s| s.play }
    end

    def each_tagline
        each { |s| yield "#{s.name} - #{s.artist}" }
    end

    def each_by_artist(name)
        my_select { |s| s.artist == name }.each { |s| yield s }
    end
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

puts playlist.my_select { |song| song.name =~ /Okie/ }
puts playlist.my_map { |song| "#{song.name} - #{song.artist}" }
puts playlist.my_reject { |song| song.name =~ /Okie/ }
puts playlist.my_detect { |song| song.artist == "Hank" }
puts playlist.my_detect { |song| song.artist == "Bob" }
puts playlist.my_any? { |song| song.artist == "Hank" }
puts playlist.my_any? { |song| song.artist == "Bob" }

puts playlist.my_reduce(0) { |sum, song| sum + song.duration }
puts playlist.my_reduce { |sum, song| sum + song.duration }