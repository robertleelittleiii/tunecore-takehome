require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :song_title => "MyString",
      :artist_id => 1,
      :album_id => 1
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input[name=?]", "song[song_title]"

      assert_select "input[name=?]", "song[artist_id]"

      assert_select "input[name=?]", "song[album_id]"
    end
  end
end
