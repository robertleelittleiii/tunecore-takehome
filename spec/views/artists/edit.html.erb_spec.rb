require 'rails_helper'

RSpec.describe "artists/edit", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
      :artist_name => "MyString"
    ))
  end

  it "renders the edit artist form" do
    render

    assert_select "form[action=?][method=?]", artist_path(@artist), "post" do

      assert_select "input[name=?]", "artist[artist_name]"
    end
  end
end
