class SwapExchange < ActiveRecord::Base
  attr_accessible :requester_id, :posessor_id, :status, :price

  validates :requester_id, :posessor_id, :status, :price, presence: true
end
