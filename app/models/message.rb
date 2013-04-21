class Message < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :title, :content, :read

  validates :sender_id, :receiver_id, :title, :content, presence: true

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

end
