class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :remember_key, :address, :sitter_rate, :swaps_earned, :dog_karma, :sitter_karma

  validates :user_name, :email, :password, presence: true 

  has_many :pets, foreign_key: :owner_id
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :senders, through: :received_messages
  has_many :receivers, through: :sent_messages

end
