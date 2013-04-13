class ScheduledSwap < ActiveRecord::Base
  attr_accessible :sitter_id, :owner_id, :rate, :start_date, :end_date, :status

  validates :sitter_id, :owner_id, :rate, :start_date, :end_date, :status, presence: true
end
