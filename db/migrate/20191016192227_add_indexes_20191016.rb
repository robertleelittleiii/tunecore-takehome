class AddIndexes20191016 < ActiveRecord::Migration[5.2]
  def change
    add_index(:songs, [:id, :song_title])
    add_index(:songs, :song_title)
    
    add_index(:albums, [:id, :album_title], unique: true)
    add_index(:albums, :album_title, unique: true)
    
    add_index(:artists, [:id, :artist_name], unique: true)
    add_index(:artists, [:artist_name], unique: true)
    
  end
end
