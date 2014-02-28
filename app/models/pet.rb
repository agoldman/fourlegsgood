class Pet < ActiveRecord::Base
   attr_accessible :name, :age, :owner_id, :care_instructions, :avatar

   validates :owner_id, presence: true

   belongs_to :owner, class_name: "User"

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>"}, :default_url => "/assets/dogmissing_:style.jpg"

   def as_json(options={})
   		super(options.merge(methods: :avatar_url))
   end

   def avatar_url
   		self.avatar.url(:large)
   end

end
