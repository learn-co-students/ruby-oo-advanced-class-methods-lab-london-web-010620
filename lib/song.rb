require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(songtitle)
    song = self.create
    song.name = songtitle
    song
  end

  def self.create_by_name(songtitle)
    song = self.create
    song.name = songtitle
    song
  end

  def self.find_by_name(songtitle)
    result = self.all.find {|song| song.name == songtitle}
    
  end

  def self.find_or_create_by_name(songtitle)
    if self.find_by_name(songtitle)
      self.find_by_name(songtitle)
    else 
      self.create_by_name(songtitle)
    end
  end

  def self.alphabetical
    alphabetised = self.all.sort_by {|song| song.name }
    alphabetised
  end

  def self.new_from_filename(filename)
    # "Thundercat - For Love I Come.mp3"
    #need to filename.split(" - ")
    #in the ex its 1 string -> make into array to select
    #Thundercat is artist_name at array[0]
    #For Love I Come.mp3 is name at array[1]
    #find a way to remove ".mp3" 
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.create
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
    
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
 