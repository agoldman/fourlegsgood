class SitterReview < ActiveRecord::Base
  attr_accessible :sitter_reviewer_id, :sitter_reviewee_id, :score, :comment

  validates :sitter_reviewer_id, :sitter_reviewee_id, :score, presence: true

  belongs_to :sitter_reviewer, class_name: "User"
  belongs_to :sitter_reviewee, class_name: "User"
end
