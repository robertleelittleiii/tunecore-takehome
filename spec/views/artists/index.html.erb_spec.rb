require 'rails_helper'

RSpec.describe "artists/index", type: :view do
  before(:each) do
    assign(:artists, [
      Artist.create!(
        :artist_name => "Artist Name"
      ),
      Artist.create!(
        :artist_name => "Artist Name"
      )
    ])
  end

  it "renders a list of artists" do
    render
    assert_select "tr>td", :text => "Artist Name".to_s, :count => 2
  end
end
