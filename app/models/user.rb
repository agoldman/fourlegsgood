class User < ActiveRecord::Base
  attr_accessible :id, :user_name, :email, :password, :remember_key, :address, :sitter_rate, :swaps_earned, :dog_karma, :sitter_karma, :description, :lat, :lng

  validates :user_name, :email, :password, presence: true 

  has_many :pets, foreign_key: :owner_id

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


  def inbox
    params = { id: @id }
    Message.where("receiver_id = :id AND read = :bool", {id: self.id, bool: false })
  end

  def messageHistoryRoots
    Message.where("(receiver_id = :id OR sender_id = :id) AND parent_id = 0", {id: self.id})
  end

  def reviewsOfMyDogs
    query = "SELECT uu.user_name, pr.score, pr.comment, pr.created_at
            FROM users u JOIN pet_reviews pr
            ON u.id = pr.pet_reviewee_id
            JOIN users uu 
            ON uu.id = pr.pet_reviewer_id
            WHERE u.id = #{self.id}
            ORDER BY pr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def reviewsOfMySitting
    query = "SELECT uu.user_name, sr.score, sr.comment, sr.created_at
            FROM users u JOIN sitter_reviews sr
            ON u.id = sr.sitter_reviewee_id
            JOIN users uu 
            ON uu.id = sr.sitter_reviewer_id
            WHERE u.id = #{self.id}
            ORDER BY sr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def reviewsOfOtherDogs
    query = "SELECT uu.user_name, pr.score, pr.comment, pr.created_at, pets.name
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
    query = "SELECT uu.user_name, sr.score, sr.comment, sr.created_at
            FROM users u JOIN sitter_reviews sr
            ON u.id = sr.sitter_reviewer_id
            JOIN users uu 
            ON uu.id = sr.sitter_reviewee_id
            WHERE u.id = #{self.id}
            ORDER BY sr.created_at DESC"
    ActiveRecord::Base.connection.execute(query);
  end

  def satForDogs
    query = "SELECT d.name
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
    query = "SELECT uu.user_name
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