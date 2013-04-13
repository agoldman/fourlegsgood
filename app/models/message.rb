class Message < ActiveRecord::Base
  attr_accessible :sender_id, :receiver_id, :title, :content
end
