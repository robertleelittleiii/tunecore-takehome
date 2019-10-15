require 'rails_helper'

RSpec.describe "artists/show", type: :view do
  before(:each) do
    @artist = assign(:artist, Artist.create!(
      :artist_name => "Artist Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Artist Name/)
  end
end
