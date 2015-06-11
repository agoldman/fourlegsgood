class Sitting < ActiveRecord::Base

  validates :sitter_id, :sat_for_owner_id, :start_date, :end_date, :status, presence: true

  belongs_to :sitter, class_name: "User"
  belongs_to :sat_for_owner, class_name: "User"
end
