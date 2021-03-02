require 'pry'

class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs
    
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
    
        def self.create(genre)
            new_genre = Genre.new(genre)
            new_genre.save
            return new_genre
        end 

        # def songs 
        #     Song.all.each do |song|
        #         song.genre == self
        #         @songs << song
        #     end
        # end

        def artists
            list = []
            songs.each do |song|
                list << song.artist
            end
            return list.uniq
        end
    
    
    end