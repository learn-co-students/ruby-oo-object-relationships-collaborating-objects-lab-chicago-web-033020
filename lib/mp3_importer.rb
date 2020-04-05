class MP3Importer
    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
        files = []
        Dir.each_child(self.path) { |file| files.push(file)}
        files
    end
  
    def import
      files.each{|file| Song.new_by_filename(file)}
    end

    def import
        files.each do |fileName|
            Song.new_by_filename(fileName)
        end
    end
  end