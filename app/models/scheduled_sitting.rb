class ScheduledSitting < ActiveRecord::Base
  attr_accessible :sitter_id, :owner_id, :rate, :start_date, :end_date, :status, :swap_payment?, :cash_payment?, :cash_payment, :cash_price

  validates :sitter_id, :owner_id, :rate, :start_date, :end_date, :status, :swap_payment?, :cash_payment?, presence: true
end
