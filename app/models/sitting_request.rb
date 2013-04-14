class SittingRequest < ActiveRecord::Base
  attr_accessible :owner_id, :start_date, :end_date, :cash_option

  validates :owner_id, :start_date, :end_date, :cash_option, presence: true
end
