class Message < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :title, :content, :read

  validates :sender_id, :receiver_id, :title, :content, presence: true
end
