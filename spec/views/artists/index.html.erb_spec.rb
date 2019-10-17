require 'rails_helper'

RSpec.describe "artists/index", type: :view do
  before(:each) do
    assign(:artists, [
      Artist.create!(
        :artist_name => "Artist Name"
      ),
      Artist.create!(
        :artist_name => "Artist Name 2"
      )
    ])
  end

  it "renders a list of artists" do
    render
    assert_select "tr>td", :text => "Artist Name".to_s, :count => 1
    assert_select "tr>td", :text => "Artist Name 2".to_s, :count => 1
  end
end
