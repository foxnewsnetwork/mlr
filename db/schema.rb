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

ActiveRecord::Schema.define(:version => 20130428192123) do

  create_table "discussions", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "buyer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listing_pictures", :force => true do |t|
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "{:null=>false}_file_name"
    t.string   "{:null=>false}_content_type"
    t.integer  "{:null=>false}_file_size"
    t.datetime "{:null=>false}_updated_at"
    t.integer  "listing_id",                  :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "title"
    t.integer  "seller_id"
    t.decimal  "price",      :precision => 14, :scale => 4
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id",       :null => false
    t.integer  "discussion_id", :null => false
    t.text     "content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "offers", :force => true do |t|
    t.decimal  "price",         :precision => 12, :scale => 4, :default => 0.0, :null => false
    t.integer  "user_id",                                                       :null => false
    t.integer  "discussion_id",                                                 :null => false
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "sellers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "sellers", ["email"], :name => "index_sellers_on_email", :unique => true
  add_index "sellers", ["reset_password_token"], :name => "index_sellers_on_reset_password_token", :unique => true

end
