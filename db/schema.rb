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

ActiveRecord::Schema.define(:version => 20130812132902) do

  create_table "cars", :force => true do |t|
    t.string   "name"
    t.string   "year_of_release"
    t.string   "price"
    t.text     "describtion"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "body_type"
    t.string   "engine"
    t.string   "engine_type"
    t.string   "transmission"
    t.string   "color"
    t.string   "mileage"
    t.string   "model"
    t.boolean  "vip",             :default => false
  end

  add_index "cars", ["created_at"], :name => "index_cars_on_created_at"

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "content"
    t.boolean  "checkf",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "feedbacks", ["created_at"], :name => "index_feedbacks_on_created_at"

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["login"], :name => "index_users_on_name", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
