require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :song_title => "Song Title",
        :artist_id => 2,
        :album_id => 3
      ),
      Song.create!(
        :song_title => "Song Title",
        :artist_id => 2,
        :album_id => 3
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Song Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
