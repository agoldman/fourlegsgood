
require 'addressable/uri'

class SittingRequest < ActiveRecord::Base

  validates :owner_id, :start_date, :end_date, :status, presence: true

  belongs_to :owner, class_name: "User"


end



















