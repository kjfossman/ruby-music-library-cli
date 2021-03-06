class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        current_dir = Dir.getwd
        Dir.chdir(@path)
        filename = Dir.glob('*.mp3')
        Dir.chdir(current_dir)
        filename
    end

    def import
        files.each do |x|
        Song.create_from_filename(x)
        end
    end

end