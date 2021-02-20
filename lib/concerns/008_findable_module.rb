module Concerns::Findable

    def self.all
        @@all
    end

    def find_by_name(song_name)
        all.detect do |x|
            x.name == song_name
        end
    end

    def find_or_create_by_name(song_name)
        if find_by_name(song_name) == nil
            create(song_name)
        else 
            find_by_name(song_name)
        end
    end

    def create(song)
        new_song = Song.new(song)
        new_song.save
        return new_song
    end 
end