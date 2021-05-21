class Artist

    @@all = []

    def self.all
        @@all
    end

    def self.song_count
        self.all.collect {|artist| artist.songs}.flatten.length
    end


    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song_by_name(name)
        new_song = Song.new(name)
        new_song.artist = self
    end

    def add_song(song)
        song.artist = self
    end

end