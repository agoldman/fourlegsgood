class Pet < ActiveRecord::Base
   attr_accessible :name, :age, :care_instructions

   validates :name, :age, presence: true
end
