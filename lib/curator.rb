class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(artist_id)
    @artists.find { |artist| artist.id == artist_id }
  end

  def photographs_by_artist
    photos_by_artist = {}
    @artists.each do |artist|
      photos_by_artist[artist] = @photographs.find_all do |photo|
        photo.artist_id == artist.id
      end
    end
    photos_by_artist
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      photographs_by_artist[artist].length > 1
    end
  end

  def photographs_taken_by_artist_from(country)
    collection = []
    photographs_by_artist.each do |artist, photos|
      collection << photos if artist.country == country
    end
    collection.flatten
  end

  def photographs_taken_between(range)
    @photographs.find_all do |photo|
      range.include? photo.year.to_i
    end
  end

end
