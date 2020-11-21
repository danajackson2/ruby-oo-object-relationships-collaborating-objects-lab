class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song_name| song_name.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if !@@all.any?{|artist| artist.name == name}
            Artist.new(name)
        else
            @@all.find{|artist| artist.name == name}
        end
    end

    def print_songs
        self.songs.each{|song| puts song.name}
    end
end