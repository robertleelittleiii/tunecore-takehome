require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
        :artist_name => "MyString"
      ))
  
    @album = assign(:album, Album.create!(
        :album_title => "MyString",
        :artist_id => @artist.id
      ))
  
    @song = assign(:song, Song.create!(
        :song_title => "Song Title",
        :album_id => @album.id
      ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Song Title/)
  end
end
