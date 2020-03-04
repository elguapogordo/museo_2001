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


end
