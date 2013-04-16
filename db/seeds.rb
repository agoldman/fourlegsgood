

user_1 = User.create!(user_name: "April", email: "aprileliza@gmail.com", password: "p")
user_2 = User.create!(user_name: "Laura", email: "laurapalmer.gmail.com", password: "l")

pet_1 = Pet.create!(name: "blixa", age: 8, owner_id: 1)
pet_2 = Pet.create!(name: "dandy", age: 7, owner_id: 1)

pet_2 = Pet.create!(name: "Sable", age:3, owner_id: 2)

