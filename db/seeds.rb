

user_1 = User.create!(user_name: "April", email: "aprileliza@gmail.com", password: "p")
user_2 = User.create!(user_name: "Laura", email: "laurapalmer.gmail.com", password: "l")

pet_1 = Pet.create!(name: "blixa", age: 8, owner_id: 1)
pet_2 = Pet.create!(name: "dandy", age: 7, owner_id: 1)

pet_2 = Pet.create!(name: "Sable", age:3, owner_id: 2)

Message_1 = Message.create!(sender_id: 1, receiver_id: 2, title: "hi", content: "watch my dog!")
user_1.sent_messages.create!(receiver_id: 2, title: "hi again", content: "seriously do it")

user_1.written_pet_reviews.create!(pet_reviewee_id: 2, score: 2)
