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
end

song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)

class Playlist
    include Enumerable

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
        select { |s| s.artist == name }.each { |s| yield s }
    end
end

playlist = Playlist.new("Country/Western, Y'all!")
playlist.add_song(song1)
playlist.add_song(song2)
playlist.add_song(song3)

playlist.each { |song| song.play }

playlist.play_songs

okie_songs = playlist.select { |song| song.name =~ /Okie/ }
p okie_songs

puts playlist.select { |song| song.artist =~ /Hank/ }
            .map { |song| "'#{song.name}' by #{song.artist} (#{song.duration} mins)..." }

playlist.each_tagline { |tagline| puts tagline }

playlist.each_by_artist("Hank") { |song| song.play }
playlist.each_by_artist("Waylon") { |song| song.play }

song1.each_filename { |filename| puts filename }