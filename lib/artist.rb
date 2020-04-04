class Artist
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select { |song| song.artist == self }
  end

  def add_song(song_name)
   song_name.artist = self
  end

  def self.find_by_name(artist_name)
    self.all.find do |artist|
      artist.name == artist_name
    end
  end

  def self.find_or_create_by_name(artist_name)
    find_by_name(artist_name) ? find_by_name(artist_name) : Artist.new(artist_name)
  end

  def print_songs
    Song.all.each { |song| puts song.name if song.artist == self }
  end

end