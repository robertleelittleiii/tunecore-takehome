class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :album_title
      t.references :artist, foreign_key: true, null: false
      t.timestamps
    end
  end
end
