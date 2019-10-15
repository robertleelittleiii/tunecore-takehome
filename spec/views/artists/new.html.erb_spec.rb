require 'rails_helper'

RSpec.describe "artists/new", type: :view do
  before(:each) do
    assign(:artist, Artist.new(
      :artist_name => "MyString"
    ))
  end

  it "renders new artist form" do
    render

    assert_select "form[action=?][method=?]", artists_path, "post" do

      assert_select "input[name=?]", "artist[artist_name]"
    end
  end
end
