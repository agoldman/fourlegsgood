class User < ActiveRecord::Base
  attr_accessible :user_name, :email, :password, :remember_key, :address, :sitter_rate, :swaps_earned, :dog_karma, :sitter_karma

  validates :user_name, :email, :password, presence: true 

  has_many :pets, foreign_key: :owner_id

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :senders, through: :received_messages
  has_many :receivers, through: :sent_messages

  has_many :written_pet_reviews, class_name: "PetReview", foreign_key: :pet_reviewer_id
  has_many :received_pet_reviews, class_name: "PetReview", foreign_key: :pet_reviewee_id
  has_many :pet_reviewees, through: :written_pet_reviews
  has_many :pet_reviewers, through: :received_pet_reviews

  has_many :sits_as_owner, class_name: "Sitting", foreign_key: :sat_for_owner_id
  has_many :sits_as_sitter, class_name: "Sitting", foreign_key: :sitter_id
  has_many :sitters, through: :sits_as_owner  #all users who have pet sat for this user
  has_many :sat_for_owners, through: :sits_as_sitter  #all users this users has pet sat for

  has_many :written_sitter_reviews, class_name: "SitterReview", foreign_key: :sitter_reviewer_id
  has_many :received_sitter_reviews, class_name: "SitterReview", foreign_key: :sitter_reviewee_id
  has_many :sitter_reviewees, through: :written_sitter_reviews
  has_many :sitter_reviewers, through: :received_sitter_reviews

  has_many :sent_swap_exchange_requests, class_name: "SwapExchange", foreign_key: :swap_requester_id
  has_many :received_swap_exchange_requests, class_name: "SwapExchange", foreign_key: :swap_posessor_id
  has_many :swap_posessors, through: :sent_swap_exchange_requests #users who had swaps this user requested to buy
  has_many :swap_requesters, through: :received_swap_exchange_requests #users who requested to buy swaps from this user

end
