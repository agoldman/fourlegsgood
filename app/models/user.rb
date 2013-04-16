class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :remember_key, :address, :sitter_rate, :swaps_earned, :dog_karma, :sitter_karma

  validates :user_name, :email, :password, presence: true

  has_many :pets, foreign_key: :owner_id

end
