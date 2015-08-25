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

ActiveRecord::Schema.define(version: 20150825030550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "responses", force: :cascade do |t|
    t.integer  "thought_id"
    t.integer  "resp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "responses", ["thought_id"], name: "index_responses_on_thought_id", using: :btree

  create_table "thoughts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "tag_list"
    t.string   "category"
  end

  add_index "thoughts", ["category"], name: "index_thoughts_on_category", using: :btree
  add_index "thoughts", ["user_id"], name: "index_thoughts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "picture"
    t.string   "about"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  add_foreign_key "responses", "thoughts"
  add_foreign_key "thoughts", "users"
end
