require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_one :pet, foreign_key: :owner_id, :dependent => :destroy
  accepts_nested_attributes_for :pet

  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id
  has_many :senders, through: :received_messages
  has_many :receivers, through: :sent_messages

  has_many :written_pet_reviews, class_name: "PetReview", foreign_key: :pet_reviewer_id
  has_many :received_pet_reviews, class_name: "PetReview", foreign_key: :pet_reviewee_id
  has_many :pet_reviewees, through: :written_pet_reviews
  has_many :pet_reviewers, through: :received_pet_reviews

  has_many :sitting_requests, foreign_key: :owner_id

  has_many :was_owner_of_sittings, class_name: "Sitting", foreign_key: :sat_for_owner_id
  has_many :was_sitter_of_sittings, class_name: "Sitting", foreign_key: :sitter_id
  has_many :sitters, through: :was_owner_of_sittings
  has_many :sat_for_owners, through: :was_sitter_of_sittings

  has_many :written_sitter_reviews, class_name: "SitterReview", foreign_key: :sitter_reviewer_id
  has_many :received_sitter_reviews, class_name: "SitterReview", foreign_key: :sitter_reviewee_id
  has_many :sitter_reviewees, through: :written_sitter_reviews
  has_many :sitter_reviewers, through: :received_sitter_reviews
  # has_many :sent_swap_exchange_requests, class_name: "SwapExchange", foreign_key: :swap_requester_id
  # has_many :received_swap_exchange_requests, class_name: "SwapExchange", foreign_key: :swap_possessor_id
  # has_many :swap_possessors, through: :sent_swap_exchange_requests #users who had swaps this user requested to buy
  # has_many :swap_requesters, through: :received_swap_exchange_requests #users who requested to buy swaps from this user

  geocoded_by :address
  after_validation :geocode

 
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing_:style.jpg"

  def after_database_authentication
    update_swaps_earned
  end 

  ## Update user in db from facebook login via omni-auth
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      #user.avatar = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.pet ||= Pet.create(owner_id: user.id)
      user.save!
    end
  end

  def upcoming
    Sitting.where("status='confirmed' AND (sitter_id = ? OR sat_for_owner_id = ?)", self.id, self.id).count
  end

  def confirm(code)
    @user_hash = BCrypt::Password.new(self.phone_code_hash)
    @user_hash == code
  end

  def verify(phone, rand)

    self.phone_code_hash = BCrypt::Password.create(rand)
    if (self.save!)
      @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
      @client.account.sms.messages.create(
        :from => '+18325393020',
        :to => '+1' + phone,
        :body => "Hey from FourLegsGood. Your code is " + rand
      )
      return true
    else
      return false
    end
  end

  def current_requests
    SittingRequest.where("owner_id= ? AND status='requested'", self.id)
  end

  def update_swaps_earned
    nights_earned = 0
    query = "SELECT s.id
             FROM users u JOIN sittings s
             ON u.id = s.sitter_id
             WHERE s.status = 'confirmed' 
             AND s.end_date < '#{DateTime.now}'"
    sitting_ids = ActiveRecord::Base.connection.execute(query);
    sitting_ids.each do |hash|
        s = Sitting.find(hash["id"])
        s.status = "occurred"
        s.save
        nights_earned = (DateTime.parse(s.end_date.to_s) - DateTime.parse(s.start_date.to_s)).ceil
      end
     swaps = self.swaps_earned + nights_earned
     self.swaps_earned = swaps
     self.save
  end

   def as_json(options={})
    super(options.merge(methods: :avatar_url))
  end

  def avatar_url
    self.avatar.url(:large)
  end

  def inbox
    params = { id: @id }
    Message.where("receiver_id = :id AND read = :bool", {id: self.id, bool: false })
  end

  def messageHistoryRoots
    Message.where("(receiver_id = :id OR sender_id = :id) AND parent_id = 0", {id: self.id})
  end

  def reviewsOfMyDogs
    query = "SELECT uu.name, pr.score, pr.comment, pr.created_at
            FROM users u JOIN pet_reviews pr
            ON u.id = pr.pet_reviewee_id
            JOIN users uu 
            ON uu.id = pr.pet_reviewer_id
            WHERE u.id = #{self.id}
            ORDER BY pr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def reviewsOfMySitting
    query = "SELECT uu.name, sr.score, sr.comment, sr.created_at
            FROM users u JOIN sitter_reviews sr
            ON u.id = sr.sitter_reviewee_id
            JOIN users uu 
            ON uu.id = sr.sitter_reviewer_id
            WHERE u.id = #{self.id}
            ORDER BY sr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def reviewsOfOtherDogs
    query = "SELECT uu.name, pr.score, pr.comment, pr.created_at, pets.name
            FROM users u JOIN pet_reviews pr
            ON u.id = pr.pet_reviewer_id
            JOIN users uu 
            ON uu.id = pr.pet_reviewee_id
            JOIN pets
            ON uu.id = pets.owner_id
            WHERE u.id = #{self.id}
            ORDER BY pr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def reviewsOfOtherSitters
    query = "SELECT uu.name, sr.score, sr.comment, sr.created_at
            FROM users u JOIN sitter_reviews sr
            ON u.id = sr.sitter_reviewer_id
            JOIN users uu 
            ON uu.id = sr.sitter_reviewee_id
            WHERE u.id = #{self.id}
            ORDER BY sr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def satForDogs
    query = "SELECT d.id
            FROM users u JOIN sittings s 
            ON u.id = s.sitter_id
            JOIN users uu
            ON uu.id = s.sat_for_owner_id
            JOIN pets d 
            ON d.owner_id = uu.id
            WHERE u.id = #{self.id}
            AND s.status = 'occurred'
            ORDER BY s.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end


  def sittersofOccurredSitting
    query = "SELECT uu.id
            FROM users u JOIN sittings s 
            ON u.id = s.sat_for_owner_id
            JOIN users uu
            ON uu.id = s.sitter_id
            WHERE u.id = #{self.id}
            AND s.status = 'occurred'
            ORDER BY s.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

end
