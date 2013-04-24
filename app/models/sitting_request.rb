
require 'addressable/uri'

class SittingRequest < ActiveRecord::Base
  attr_accessible :owner_id, :start_date, :end_date, :status

  validates :owner_id, :start_date, :end_date, :status, presence: true

  belongs_to :owner, class_name: "User"


  def self.Requested
  	SittingRequest.where(status: "requested")
  end

  def self.addressesOfRequested
	  User.find_by_sql("SELECT address FROM users
		  INNER JOIN sitting_requests ON users.id = sitting_requests.owner_id
		  WHERE sitting_requests.status = 'requested'"
	    )
  end

  def self.geocodedAddresses
  queries = (self.addressesOfRequested).map do |address|
				geocode = Addressable::URI.new(
				  :scheme => "http",
				  :host => "maps.googleapis.com",
				  :path => "/maps/api/geocode/json",
				  :query_values => {:address => "160 Folsom Street, San Francisco, CA",
				                     :sensor => "false"
				                    }
				  ).to_s
		end
	geocode_responses = queries.map do |query|
		JSON.parse(RestClient.get(query))
		end

	latlongs = geocode_responses.map do |gc_response|
		lat = gc_response["results"][0]["geometry"]["location"]["lat"]
		lng = gc_response["results"][0]["geometry"]["location"]["lng"]
		[lat, lng]
	end
  end

end
