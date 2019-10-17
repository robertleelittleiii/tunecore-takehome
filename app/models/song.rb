class Song < ApplicationRecord
  
  belongs_to :album
  
  validates_presence_of :song_title, :album_id

  #
  # Song.search
  #
  # params is a hash of search terms.
  # =>  :album_title
  # =>  :song_title
  # =>  :artist_name
  #
  # params empty will return all Song records.
  #
  
  def self.search(search={}, order={})
   
    album_title = search[:album_title]
    song_title = search[:song_title]
    artist_name = search[:artist_name]
   
    results = all.eager_load(:album, {album: :artist})
    results = results.where("songs.song_title like ?","%#{song_title}%") if song_title.present?
    results = results.eager_load(:album).where("albums.album_title like ?","%#{album_title}%") if album_title.present?
    results = results.eager_load(:album, {album: :artist}).where("artists.artist_name like ?","%#{artist_name}%") if artist_name.present?
   
    results = results.order(order[:by]=>order[:direction]) if order.present?
   
    return results

  end
 
 
end
