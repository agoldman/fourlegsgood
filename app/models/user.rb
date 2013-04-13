class User < ActiveRecord::Base
  attr_accessible :name, :remember_key, :latitude, :longitude, :email, :rate, :swaps_earned, :dog_karma, :sitter_karma

  validates :name, :email, :rate, presence: true

end
