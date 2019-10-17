require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
      :artist_name => "MyString"
    ))
  
    @album = assign(:album, Album.create!(
      :album_title => "MyString",
      :artist_id => @artist.id
    ))
  
    @song = assign(:song, Song.create!(
      :song_title => "MyString",
      :album_id => @album.id
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input[name=?]", "song[song_title]"

      assert_select "input[name=?]", "song[album_id]"
    end
  end
end
