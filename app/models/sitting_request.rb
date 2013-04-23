class SittingRequest < ActiveRecord::Base
  attr_accessible :owner_id, :start_date, :end_date, :status

  validates :owner_id, :start_date, :end_date, :status, presence: true

  belongs_to :owner, class_name: "User"


  def self.Requested
  	SittingRequest.where(status: "requested")
  end

  def self.addressesofRequested
	  User.find_by_sql("SELECT address FROM users
		  INNER JOIN sitting_requests ON users.id = sitting_requests.owner_id
		  WHERE sitting_requests.status = 'requested'"
	    )
  end
end
