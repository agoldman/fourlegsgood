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

ActiveRecord::Schema.define(:version => 20130414033753) do

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "messages", ["receiver_id"], :name => "index_messages_on_receiver_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "pet_reviews", :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pet_reviews", ["reviewee_id"], :name => "index_pet_reviews_on_reviewee_id"
  add_index "pet_reviews", ["reviewer_id"], :name => "index_pet_reviews_on_reviewer_id"

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "owner_id"
    t.text     "care_instructions"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "scheduled_sittings", :force => true do |t|
    t.integer  "sitter_id"
    t.integer  "owner_id"
    t.integer  "rate"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.boolean  "swap_payment?"
    t.boolean  "cash_payment?"
    t.decimal  "cash_price"
    t.integer  "swap_price"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "scheduled_sittings", ["owner_id"], :name => "index_scheduled_sittings_on_owner_id"
  add_index "scheduled_sittings", ["sitter_id"], :name => "index_scheduled_sittings_on_sitter_id"

  create_table "sitter_reviews", :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "score"
    t.text     "comment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sitter_reviews", ["reviewee_id"], :name => "index_sitter_reviews_on_reviewee_id"
  add_index "sitter_reviews", ["reviewer_id"], :name => "index_sitter_reviews_on_reviewer_id"

  create_table "sitting_requests", :force => true do |t|
    t.integer  "owner_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "cash_option"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sitting_requests", ["owner_id"], :name => "index_sitting_requests_on_owner_id"

  create_table "swap_exchanges", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "posessor_id"
    t.string   "status"
    t.decimal  "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "swap_exchanges", ["posessor_id"], :name => "index_swap_exchanges_on_posessor_id"
  add_index "swap_exchanges", ["requester_id"], :name => "index_swap_exchanges_on_requester_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "remember_key"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "sitter_rate"
    t.integer  "dog_karma"
    t.integer  "sitter_karma"
    t.integer  "swaps_earned", :default => 1
    t.integer  "swap_price"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
