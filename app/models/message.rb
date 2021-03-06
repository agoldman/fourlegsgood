class Message < ActiveRecord::Base

  validates :sender_id, :receiver_id, :title, :content, presence: true

  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def conversationView
  	Message.where("parent_id = :id or id = :id", {id: self.id}).order("created_at ASC")
  end

end