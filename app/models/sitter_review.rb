class SitterReview < ActiveRecord::Base
  attr_accessible :reviewer_id, :reviewee_id, :score, :comment

  validates :reviewer_id, :reviewee_id, :score, presence: true
end
