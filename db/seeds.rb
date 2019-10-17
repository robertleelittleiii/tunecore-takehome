# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


music_info = Discog.new(DISCOG_CONFIG["api_key"], DISCOG_CONFIG["api_secret"])

max_songs = DISCOG_CONFIG["songs_to_load"]
max_artists = DISCOG_CONFIG["artists_to_load"]
max_albums = DISCOG_CONFIG["albums_to_load"]

album_count = 0
artist_count = 0
song_count = 0

page_count = 1
page_max = 999
max_data = false

default_query = DISCOG_CONFIG["search_terms"]

until (max_data or page_count > page_max) do
  results = music_info.search(default_query, page_count)
  page_count += 1
  page_max = results["pagination"]["pages"]
  
  master_ids =results["results"].collect{|resp| resp["master_id"]}.reject { |c| c==0 or c.blank? }.uniq
 
  master_ids.each_with_index do |master_id, count|
    release_results =  music_info.get("masters",master_id)
    if release_results["message"].nil? then
      artist_count += release_results["artists"].size
      song_count += release_results["tracklist"].size 
      release_results["artists"].each do |song_artist|
        artist = Artist.find_or_create_by(artist_name: song_artist["name"])
        album = Album.find_or_create_by(album_title: release_results["title"])
        artist.albums << album
        artist.save
        album.save

        release_results["tracklist"].each do |track|
          song = Song.create({song_title: track["title"]} )
          album.songs << song
          song.save
        end
      end
      album_count += 1
     
    else
      puts(release_results["message"])
    end
    
    sleep(2.4) # throttle time (max 25 per min)
   
    max_data = ((album_count >= max_albums) and (artist_count >= max_artists) and (song_count >= max_songs))
   
    break if max_data
  
  end
  
end

puts("Albums added: #{album_count}, artists added: #{artist_count}, songs added: #{song_count}")
