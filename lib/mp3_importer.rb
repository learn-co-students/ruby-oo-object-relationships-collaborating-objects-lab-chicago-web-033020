class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    new_arr = []
    Dir.each_child(self.path) { |file| new_arr << file}
    new_arr
  end 

  def import
    self.files.each { |file| Song.new_by_filename(file) }
  end
  
end