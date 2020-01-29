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
    song = Song.new
    song.save
    return song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    return song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song 
    return song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      return result
    else 
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    @@all.sort{ |a, z| a.name <=> z.name }
  end

  def self.new_from_filename(filename)
    song = Song.new

    delimiters =["-","."]
    split_string = filename.split(Regexp.union(delimiters))

    song.artist_name = split_string[0].strip
    song.name = split_string[1].strip
    return song
  end

  def self.create_from_filename
    song = Song.create

    delimiters =["-","."]
    split_string = filename.split(Regexp.union(delimiters))

    song.artist_name = split_string[0].strip
    song.name = split_string[1].strip
    return song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
