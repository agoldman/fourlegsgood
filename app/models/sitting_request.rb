
require 'addressable/uri'

class SittingRequest < ActiveRecord::Base
  attr_accessible :owner_id, :start_date, :end_date, :status

  # validates :owner_id, :start_date, :end_date, :status, presence: true

  belongs_to :owner, class_name: "User"


end



















