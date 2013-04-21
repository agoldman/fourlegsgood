class Pet < ActiveRecord::Base
   attr_accessible :name, :age, :owner_id, :care_instructions

   validates :name, :age, :owner_id, presence: true

   belongs_to :owner, class_name: "User"
end
