require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    
     @artist = assign(:artist, Artist.create!(
      :artist_name => "MyString"
    ))
  
    @album = assign(:album, Album.create!(
      :album_title => "MyString",
      :artist_id => @artist.id
    ))
  
  end

  it "renders the edit album form" do
    render

      assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input[name=?]", "album[album_title]"

      assert_select "input[name=?]", "album[artist_id]"
    end
  end
end
