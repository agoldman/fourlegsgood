ActiveRecord::Base.transaction do

user_1 = User.create!(user_name: "April", email: "aprileliza@gmail.com", password: "password", address: "160 Randall Street, San Francisco, CA, 94131")
user_2 = User.create!(user_name: "Laura", email: "aprileliza1@gmail.com", password: "password", address: "3976 23rd Street, San Francisco, CA 94114")
user_3 = User.create!(user_name: "James", email: "aprileliza2@gmail.com", password: "password", address: "924 Mason St, San Francisco, CA 94129")
user_4 = User.create!(user_name: "Tess", email: "aprileliza3@gmail.com", password: "password", address: "598 23rd Street, Oakland, CA")
user_5 = User.create!(user_name: "Joshua", email: "aprileliza4@gmail.com", password: "password", address: "400 MLK Junior Way, Oakland, CA")

pet_1 = Pet.create!(name: "blixa", age: 8, owner_id: 1)
pet_2 = Pet.create!(name: "dandy", age: 7, owner_id: 1)
pet_3 = Pet.create!(name: "Maggie", age: 7, owner_id: 3)
pet_4 = Pet.create!(name: "mr. dog", age: 1, owner_id:4)
pet_5 = Pet.create!(name: "the woofster", age: 3, owner_id: 5)
pet_6 = Pet.create!(name: "captian evil", age: 6, owner_id: 2)

pet_2 = Pet.create!(name: "Sable", age:3, owner_id: 2)

Message_1 = Message.create!(sender_id: 1, receiver_id: 2, title: "hi", content: "watch my dog!")
user_2.sent_messages.create(receiver_id: 1, title: "oh hello", content: "maybe!", read: false, parent_id: 1)
user_1.sent_messages.create!(receiver_id: 2, title: "hi again", content: "seriously do it", parent_id: 1)

user_1.written_pet_reviews.create!(pet_reviewee_id: 2, score: 2)
user_2.written_pet_reviews.create!(pet_reviewee_id: 1, score: 5, comment: "cool dog!")

user_1.written_sitter_reviews.create!(sitter_reviewee_id: 2, score: 5, comment: "rad sitter!")
user_2.written_sitter_reviews.create!(sitter_reviewee_id: 1, score: 4, comment: "bad ass chica")

user_1.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 1)
user_2.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-07", status:'requested', owner_id: 2)
user_3.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 3)
user_4.sitting_requests.create!(start_date: "2013-04-15", end_date: "2013-05-04", status:'requested', owner_id: 4)
user_5.sitting_requests.create!(start_date: "2013-05-03", end_date: "2013-05-04", status:'requested', owner_id: 5)
# user_1.sent_swap_exchange_requests.create!(swap_possessor_id: 2, status: "pending", price: 10.50)
user_1.was_owner_of_sittings.create!(sitter_id: 2, start_date: '2001-01-01', end_date: '2002-02-02', status: 'pending', cash_price: 10, swap_price: 1)
user_1.was_owner_of_sittings.create!(sitter_id: 3, start_date: '2004-01-01', end_date: '2004-02-02', status: 'occurred', cash_price: 10, swap_price: 1)
user_1.was_sitter_of_sittings.create!(sat_for_owner_id: 2, start_date: '2002-02-02', end_date: '2003-03-03', status: 'occurred', cash_price: 0, swap_price: 0)


end

