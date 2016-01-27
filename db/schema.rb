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

ActiveRecord::Schema.define(version: 20160127104730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "content"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "agendas", ["event_id"], name: "index_agendas_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",                default: "New Event"
    t.string   "place"
    t.date     "date"
    t.time     "time"
    t.integer  "user_id",                                   null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "events", ["name"], name: "index_events_on_name", using: :btree
  add_index "events", ["place"], name: "index_events_on_place", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "events_guests", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "guest_id", null: false
  end

  add_index "events_guests", ["event_id"], name: "index_events_guests_on_event_id", using: :btree
  add_index "events_guests", ["guest_id"], name: "index_events_guests_on_guest_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["email"], name: "index_guests_on_email", using: :btree

  create_table "main_pages", force: :cascade do |t|
    t.string   "title",                  default: "Main Page"
    t.text     "header"
    t.text     "content"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "event_id"
    t.string   "jumbotron_file_name"
    t.string   "jumbotron_content_type"
    t.integer  "jumbotron_file_size"
    t.datetime "jumbotron_updated_at"
  end

  add_index "main_pages", ["event_id"], name: "index_main_pages_on_event_id", using: :btree
  add_index "main_pages", ["title"], name: "index_main_pages_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",                               null: false
    t.string   "role",                   default: "user"
    t.string   "name"
    t.string   "surname"
    t.string   "company_name"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

end
