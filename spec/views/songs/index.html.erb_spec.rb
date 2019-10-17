require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    
     @artist1 = assign(:artist, Artist.create!(
      :artist_name => "MyString1"
    ))
  
    @album1 = assign(:album, Album.create!(
      :album_title => "MyString1",
      :artist_id => @artist1.id
    ))
   @artist2 = assign(:artist, Artist.create!(
      :artist_name => "MyString2"
    ))
  
    @album2 = assign(:album, Album.create!(
      :album_title => "MyString2",
      :artist_id => @artist2.id
    ))
  
    
    
    assign(:songs, [
      Song.create!(
        :song_title => "Song Title",
        :album_id => @album1.id
      ),
      Song.create!(
        :song_title => "Song Title 2",
        :album_id => @album2.id
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Song Title".to_s, :count => 1
    assert_select "tr>td", :text => "Song Title 2".to_s, :count => 1
    assert_select "tr>td", :text => @album1.id.to_s, :count => 1
    assert_select "tr>td", :text => @album2.id.to_s, :count => 1
  end
end
