class Song < ApplicationRecord
  
  belongs_to :album
  belongs_to :artist, through: :album
  
  
  
  
 def search (params)
   
   album_title = params[:album_title]
   song_title = params[:song_title]
   artist_name = params[:artist_name]
   
   results = all.includes(:album, :artist)
   results = results.where("albums.album_title like #{album_title}") if album_title.present?
   results = results.where("songs.song_title like #{song_title}") if song_title.present?
   results = results.where("atrists.artist_name like #{artist_name}") if artist_name.present?
   
   return results
   
 end
 
 
end
