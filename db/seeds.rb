ActiveRecord::Base.transaction do

user_1 = User.create!(name: "April", email: "fbtest@test.com")
user_2 = User.create!(name: "Laura", email: "aprileliza1@gmail.com")
user_3 = User.create!(name: "James", email: "aprileliza2@gmail.com")
user_4 = User.create!(name: "Tess", email: "aprileliza3@gmail.com")
user_5 = User.create!(name: "Joshua", email: "aprileliza4@gmail.com")

# user_1.pets.create!(name: "blixa", age: 8, owner_id: 1)
# user_1.pets.create!(name: "dandy", age: 7, owner_id: 1)
# user_3.pets.create!(name: "Maggie", age: 7, owner_id: 3)
# user_4.pets.create!(name: "mr. dog", age: 1, owner_id:4)
# user_5.pets.create!(name: "the woofster", age: 3, owner_id: 5)
# user_2.pets.create!(name: "captian evil", age: 6, owner_id: 2)

# user_2.pets.create!(name: "Sable", age:3, owner_id: 2)

# Message_1 = Message.create!(sender_id: 1, receiver_id: 2, title: "hi", content: "watch my dog!")
# user_2.sent_messages.create(receiver_id: 1, title: "oh hello", content: "maybe!", read: false, parent_id: 1)
# user_1.sent_messages.create!(receiver_id: 2, title: "hi again", content: "seriously do it", parent_id: 1)

# user_1.written_pet_reviews.create!(pet_reviewee_id: 2, score: 2)
# user_2.written_pet_reviews.create!(pet_reviewee_id: 1, score: 5, comment: "cool dog!")

# user_1.written_sitter_reviews.create!(sitter_reviewee_id: 2, score: 5, comment: "rad sitter!")
# user_2.written_sitter_reviews.create!(sitter_reviewee_id: 1, score: 4, comment: "bad ass chica")

# user_1.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 1)
# user_2.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-07", status:'requested', owner_id: 2)
# user_3.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 3)
# user_4.sitting_requests.create!(start_date: "2013-04-15", end_date: "2013-05-04", status:'requested', owner_id: 4)
# user_5.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 5)
# # user_1.sent_swap_exchange_requests.create!(swap_possessor_id: 2, status: "pending", price: 10.50)
# user_1.was_owner_of_sittings.create!(sitter_id: 2, start_date: '2001-01-01', end_date: '2002-02-02', status: 'pending', cash_price: 10, swap_price: 1)
# user_1.was_owner_of_sittings.create!(sitter_id: 3, start_date: '2004-01-01', end_date: '2004-02-02', status: 'occurred', cash_price: 10, swap_price: 1)
# user_1.was_sitter_of_sittings.create!(sat_for_owner_id: 2, start_date: '2002-02-02', end_date: '2003-03-03', status: 'occurred', cash_price: 0, swap_price: 0)


end

