class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :remember_key, :latitude, :longitude, :sitter_rate, :swaps_earned, :dog_karma, :sitter_karma

  validates :name, :email, :password, presence: true

  has_many :pets, foreign_key: :owner_id

end
