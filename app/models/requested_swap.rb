class RequestedSwap < ActiveRecord::Base
  attr_accessible :user_id, :start_date, :end_date, :cash_option

  validates :user_id, :start_date, :end_date, :cash_option, presence: true
end
