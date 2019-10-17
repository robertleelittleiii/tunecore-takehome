require 'rails_helper'

RSpec.describe "albums/index", type: :view do
  before(:each) do
    
    @artist1 = assign(:artist, Artist.create!(
        :artist_name => "MyString"
      ))
    @artist2 = assign(:artist, Artist.create!(
        :artist_name => "MyString 2"
      ))
    assign(:albums, [
        Album.create!(
          :album_title => "Album Title",
          :artist_id => @artist1.id
        ),
        Album.create!(
          :album_title => "Album Title 2",
          :artist_id => @artist2.id
        )
      ])
  end

  it "renders a list of albums" do
    render
    assert_select "tr>td", :text => "Album Title".to_s, :count => 1
    assert_select "tr>td", :text => "Album Title 2".to_s, :count => 1
  end
end
