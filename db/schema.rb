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

ActiveRecord::Schema.define(version: 20160103161415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "main_page_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree

  create_table "events_guests", force: :cascade do |t|
    t.integer "event_id"
    t.integer "guest_id"
  end

  add_index "events_guests", ["event_id"], name: "index_events_guests_on_event_id", using: :btree
  add_index "events_guests", ["guest_id"], name: "index_events_guests_on_guest_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["email"], name: "index_guests_on_email", using: :btree

  create_table "main_pages", force: :cascade do |t|
    t.string   "title"
    t.text     "header"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "main_pages", ["title"], name: "index_main_pages_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email",           null: false
    t.string   "role"
    t.string   "name"
    t.string   "surname"
    t.string   "company_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

end
