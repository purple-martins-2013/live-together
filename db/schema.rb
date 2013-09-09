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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130908082542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
    t.date     "last_completed"
    t.integer  "points"
    t.integer  "frequency"
    t.date     "due_date"
  end

  create_table "completed_chores", force: true do |t|
    t.integer  "user_id"
    t.integer  "chore_id"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grocery_items", force: true do |t|
    t.string   "name"
    t.integer  "grocery_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grocery_items", ["name", "grocery_list_id"], name: "index_grocery_items_on_name_and_grocery_list_id", unique: true, using: :btree

  create_table "grocery_lists", force: true do |t|
    t.string   "name"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "grocery_lists", ["name", "house_id"], name: "index_grocery_lists_on_name_and_house_id", unique: true, using: :btree

  create_table "grocery_lists_users", id: false, force: true do |t|
    t.integer "grocery_list_id"
    t.integer "user_id"
  end

  create_table "houses", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
