require 'rails_helper'

RSpec.describe "albums/show", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
        :artist_name => "MyString"
      ))
  
    @album = assign(:album, Album.create!(
        :album_title => "Album Title",
        :artist_id => @artist.id
      ))
  
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Album Title/)
  end
end
