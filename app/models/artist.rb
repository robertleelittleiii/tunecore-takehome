class Artist < ApplicationRecord

  has_many :albums  
  has_many :songs, through: :albums

  validates_presence_of :artist_name

end
