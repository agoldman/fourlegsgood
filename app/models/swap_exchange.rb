class SwapExchange < ActiveRecord::Base
  attr_accessible :swap_requester_id, :swap_posessor_id, :status, :price

  validates :swap_requester_id, :swap_posessor_id, :status, :price, presence: true

  belongs_to :swap_requester, class_name: "User"
  belongs_to :swap_posessor, class_name: "User"

end
