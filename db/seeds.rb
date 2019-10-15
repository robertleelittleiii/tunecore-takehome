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
default_query = DISCOG_CONFIG["search_terms"]

 results = music_info.search(default_query)

 puts(music_info.last_results)

 master_ids =results["results"].collect{|resp| resp["id"]}

 puts(master_ids)
 
 master_ids.each_with_index do |master_id, count|
   puts(count)
    release_results =  music_info.get("masters",master_id)
    if release_results["message"].nil? then
         artist_count += release_results["artists"].size
      song_count += release_results["tracklist"].size 
      release_results["tracklist"].each do |track|
        release_results["artists"].each do |artist|
          puts("Album: #{release_results["title"]}, Artist:#{artist["name"]}, Song: #{track["title"]}")
           end
      end
            album_count += 1

    else
        puts(release_results["message"])
    end
    sleep(5)
end

      puts("Albums added: #{song_count}, artists added: #{artist_count}, songs added: #{song_count}")
