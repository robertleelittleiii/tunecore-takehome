json.extract! album, :id, :album_title, :artist_id, :created_at, :updated_at
json.url album_url(album, format: :json)
