class PetReview < ActiveRecord::Base

  validates :pet_reviewer_id, :pet_reviewee_id, :score, presence: true

  belongs_to :pet_reviewer, class_name: "User"
  belongs_to :pet_reviewee, class_name: "User"
end
