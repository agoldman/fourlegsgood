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

ActiveRecord::Schema.define(:version => 20130413182159) do

  create_table "message_ancestors", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "message_ancestors", ["child_id"], :name => "index_message_ancestors_on_child_id"
  add_index "message_ancestors", ["parent_id"], :name => "index_message_ancestors_on_parent_id"

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
    t.text     "care_instructions"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "requested_swaps", :force => true do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "cash_option"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "requested_swaps", ["user_id"], :name => "index_requested_swaps_on_user_id"

  create_table "scheduled_swaps", :force => true do |t|
    t.integer  "sitter_id"
    t.integer  "owner_id"
    t.integer  "rate"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "remember_key"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "email"
    t.boolean  "accepts_cash"
    t.decimal  "rate"
    t.integer  "dog_karma"
    t.integer  "sitter_karma"
    t.integer  "swaps_earned", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
