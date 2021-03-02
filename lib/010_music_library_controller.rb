require 'pry'


class MusicLibraryController
    attr_accessor :obj

    def initialize(path = './db/mp3s')
        @path = path
        @obj = MusicImporter.new(path)
        @obj.import
    end

    def call
        input = ""
        while input != 'exit'
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
            input = gets
        if input == 'list songs'
            list_songs
        elsif input == 'list artists'
            list_artists
        elsif input == 'list genres'
            list_genres
        elsif input == 'list artist'
            list_songs_by_artist
        elsif input == 'list genre'
            list_songs_by_genre
        elsif input == 'play song'
            play_song
        end    
        end
    end

    def list_songs
        ord_list = []
        ord_list = Song.all.sort_by do |x|
            x.name
        end
        ord_list.each.with_index(1) do |value, index|
            puts "#{index}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
        end
    end

    def list_artists
        list = []
        list = Artist.all.sort_by do |x|
            x.name
        end
        list.each.with_index(1) do |value, index|
            puts "#{index}. #{value.name}"
        end
    end

    def list_genres
        list = []
        list = Genre.all.sort_by do |x|
            x.name
        end
        list.each.with_index(1) do |value, index|
            puts "#{index}. #{value.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets
        list = []
        obj = Artist.find_by_name(input)
        # binding.pry
        if obj 
            list = obj.songs.sort_by do |x|
                x.name
            end
            list.each.with_index(1) do |value, index|
                # binding.pry
                puts "#{index}. #{value.name} - #{value.genre.name}"
            end   
         end   
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets
        list = []
        obj = Genre.find_by_name(input)
        if obj 
            list = obj.songs.sort_by do |x|
                x.name
            end
            list.each.with_index(1) do |value, index|
                puts "#{index}. #{value.artist.name} - #{value.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets
        input = input.to_i - 1
        var = Song.all.sort_by do |x|
                 x.name 
                end
        if (0..Song.all.length - 1).include?(input) 
            # binding.pry
            puts "Playing #{var[input].name} by #{var[input].artist.name}"
         end
    end

    def command
        if self.call == 'list songs'
            list_songs
        end
    end


end