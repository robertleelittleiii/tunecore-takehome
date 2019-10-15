require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :song_title => "MyString",
      :artist_id => 1,
      :album_id => 1
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input[name=?]", "song[song_title]"

      assert_select "input[name=?]", "song[artist_id]"

      assert_select "input[name=?]", "song[album_id]"
    end
  end
end
