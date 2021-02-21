require 'pry'

class Song
attr_accessor :name, :artist, :genre

@@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist
        self.genre = genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def save
        @@all << self
    end

    def self.create(song)
        new_song = Song.new(song)
        new_song.save
        return new_song
    end 

    def genre=(genre)
        @genre = genre
        if !genre
        elsif genre.songs.include?(self)
        else
            genre.songs << self
        end
    end

    def artist=(artist)
        @artist = artist
        if artist
        artist.add_song(self)
        end
        #binding.pry
    end

    def self.find_by_name(song_name)
        all.detect do |x|
            x.name == song_name
        end
    end

    def self.find_or_create_by_name(song_name)
        if find_by_name(song_name) == nil
            create(song_name)
        else 
            find_by_name(song_name)
        end
    end

    def self.new_from_filename(filename)
        file = filename.split(' - ')
        genre_file = file[2].split(".")
        song = find_or_create_by_name(file[1])
        song.artist = Artist.find_or_create_by_name(file[0])
        song.genre = Genre.find_or_create_by_name(genre_file[0])
        song
    end

    def self.create_from_filename(filename)
        new_from_filename(filename)
    end

end