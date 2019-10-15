require 'rails_helper'

RSpec.describe "albums/new", type: :view do
  before(:each) do
    assign(:album, Album.new(
      :album_title => "MyString",
      :artist_id => 1
    ))
  end

  it "renders new album form" do
    render

    assert_select "form[action=?][method=?]", albums_path, "post" do

      assert_select "input[name=?]", "album[album_title]"

      assert_select "input[name=?]", "album[artist_id]"
    end
  end
end
