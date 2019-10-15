require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :song_title => "Song Title",
      :artist_id => 2,
      :album_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Song Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
