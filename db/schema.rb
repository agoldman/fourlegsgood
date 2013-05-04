# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130503022417) do

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "read",        :default => false
    t.integer  "parent_id",   :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "messages", ["parent_id"], :name => "index_messages_on_parent_id"
  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "pet_reviews", :force => true do |t|
    t.integer  "pet_reviewer_id"
    t.integer  "pet_reviewee_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "pet_reviews", ["pet_reviewee_id"], :name => "index_pet_reviews_on_pet_reviewee_id"
  add_index "pet_reviews", ["pet_reviewer_id"], :name => "index_pet_reviews_on_pet_reviewer_id"

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "owner_id"
    t.text     "care_instructions"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sitter_reviews", :force => true do |t|
    t.integer  "sitter_reviewer_id"
    t.integer  "sitter_reviewee_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "sitter_reviews", ["sitter_reviewee_id"], :name => "index_sitter_reviews_on_sitter_reviewee_id"
  add_index "sitter_reviews", ["sitter_reviewer_id"], :name => "index_sitter_reviews_on_sitter_reviewer_id"

  create_table "sitting_requests", :force => true do |t|
    t.integer  "owner_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status",     :default => "requested"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "sitting_requests", ["owner_id"], :name => "index_sitting_requests_on_owner_id"

  create_table "sittings", :force => true do |t|
    t.integer  "sitter_id"
    t.integer  "sat_for_owner_id"
    t.string   "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "cash_price"
    t.integer  "swap_price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "sittings", ["sat_for_owner_id"], :name => "index_sittings_on_sat_for_owner_id"
  add_index "sittings", ["sitter_id"], :name => "index_sittings_on_sitter_id"

  create_table "swap_exchanges", :force => true do |t|
    t.integer  "swap_requester_id"
    t.integer  "swap_possessor_id"
    t.string   "status"
    t.decimal  "price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "swap_exchanges", ["swap_possessor_id"], :name => "index_swap_exchanges_on_swap_possessor_id"
  add_index "swap_exchanges", ["swap_requester_id"], :name => "index_swap_exchanges_on_swap_requester_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "user_name"
    t.text     "about_me"
    t.string   "address"
    t.decimal  "sitter_rate"
    t.integer  "dog_karma"
    t.integer  "sitter_karma"
    t.integer  "swaps_earned",        :default => 1
    t.integer  "swap_price"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
