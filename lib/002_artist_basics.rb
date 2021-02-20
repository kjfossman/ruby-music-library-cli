require 'pry'

class Artist
    extend Concerns::Findable
    attr_accessor :name
    
    @@all = []
    
        def initialize(name)
            @name = name
            @songs = []
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
    
        def self.create(name)
            new_artist = Artist.new(name)
            new_artist.save
            return new_artist
        end 

        def songs
            Song.all.each do |song|
                if song.artist == self
                    @songs << song
                end
            end
        end

        def add_song(song)
            if !song.artist
            song.artist = self
            self.songs << song
            end
        end

        def genres
            list = []
            songs.each do |song|
                list << song.genre
            end
            return list.uniq
        end


    
    
    end