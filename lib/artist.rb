require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(artist_name)
    find_artist(artist_name) ? find_artist(artist_name) : Artist.new(artist_name)
  end

  def self.find_artist(artist_name)
    self.all.find do |artist|
      artist.name == artist_name
      end
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end