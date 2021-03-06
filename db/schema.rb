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

ActiveRecord::Schema.define(version: 20_160_530_212_434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'agendas', force: :cascade do |t|
    t.integer  'event_id'
    t.text     'content'
    t.string   'picture_file_name'
    t.string   'picture_content_type'
    t.integer  'picture_file_size'
    t.datetime 'picture_updated_at'
    t.datetime 'created_at',           null: false
    t.datetime 'updated_at',           null: false
  end

  add_index 'agendas', ['event_id'], name: 'index_agendas_on_event_id', using: :btree

  create_table 'comments', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'event_id'
    t.text     'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'comments', ['event_id'], name: 'index_comments_on_event_id', using: :btree
  add_index 'comments', ['user_id'], name: 'index_comments_on_user_id', using: :btree

  create_table 'event_users', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'event_id'
    t.string   'role', default: 'admin'
    t.datetime 'created_at',                   null: false
    t.datetime 'updated_at',                   null: false
  end

  add_index 'event_users', ['event_id'], name: 'index_event_users_on_event_id', using: :btree
  add_index 'event_users', %w(user_id event_id), name: 'index_event_users_on_user_id_and_event_id', unique: true, using: :btree
  add_index 'event_users', ['user_id'], name: 'index_event_users_on_user_id', using: :btree

  create_table 'events', force: :cascade do |t|
    t.string   'name',                default: 'New Event'
    t.string   'place'
    t.date     'date'
    t.time     'time'
    t.datetime 'created_at',                                null: false
    t.datetime 'updated_at',                                null: false
    t.text     'description'
    t.string   'avatar_file_name'
    t.string   'avatar_content_type'
    t.integer  'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.string   'category'
    t.boolean  'published',           default: false
    t.integer  'participants',        default: 0
  end

  add_index 'events', ['name'], name: 'index_events_on_name', using: :btree
  add_index 'events', ['place'], name: 'index_events_on_place', using: :btree

  create_table 'events_guests', force: :cascade do |t|
    t.integer 'event_id', null: false
    t.integer 'guest_id', null: false
  end

  add_index 'events_guests', ['event_id'], name: 'index_events_guests_on_event_id', using: :btree
  add_index 'events_guests', ['guest_id'], name: 'index_events_guests_on_guest_id', using: :btree

  create_table 'events_hotels', force: :cascade do |t|
    t.integer  'event_id'
    t.integer  'hotel_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'followers', force: :cascade do |t|
    t.integer  'user_id'
    t.integer  'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'followers', ['event_id'], name: 'index_followers_on_event_id', using: :btree
  add_index 'followers', %w(user_id event_id), name: 'index_followers_on_user_id_and_event_id', unique: true, using: :btree
  add_index 'followers', ['user_id'], name: 'index_followers_on_user_id', using: :btree

  create_table 'guests', force: :cascade do |t|
    t.string   'email',      null: false
    t.string   'name'
    t.string   'surname'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'guests', ['email'], name: 'index_guests_on_email', using: :btree

  create_table 'hotel_pictures', force: :cascade do |t|
    t.integer  'hotel_id'
    t.string   'picture_file_name'
    t.string   'picture_content_type'
    t.integer  'picture_file_size'
    t.datetime 'picture_updated_at'
    t.datetime 'created_at',           null: false
    t.datetime 'updated_at',           null: false
  end

  create_table 'hotels', force: :cascade do |t|
    t.string   'name'
    t.string   'city'
    t.string   'address'
    t.text     'description'
    t.string   'link'
    t.integer  'standard'
    t.string   'phone'
    t.string   'email'
    t.string   'picture_file_name'
    t.string   'picture_content_type'
    t.integer  'picture_file_size'
    t.datetime 'picture_updated_at'
    t.datetime 'created_at',           null: false
    t.datetime 'updated_at',           null: false
    t.integer  'user_id'
  end

  add_index 'hotels', ['city'], name: 'index_hotels_on_city', using: :btree
  add_index 'hotels', ['name'], name: 'index_hotels_on_name', using: :btree
  add_index 'hotels', ['user_id'], name: 'index_hotels_on_user_id', using: :btree

  create_table 'hotes_events', force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'hotels_id'
  end

  add_index 'hotes_events', ['event_id'], name: 'index_hotes_events_on_event_id', using: :btree
  add_index 'hotes_events', ['hotels_id'], name: 'index_hotes_events_on_hotels_id', using: :btree

  create_table 'main_pages', force: :cascade do |t|
    t.string   'title', default: 'Main Page'
    t.text     'header'
    t.text     'content'
    t.datetime 'created_at',                                   null: false
    t.datetime 'updated_at',                                   null: false
    t.integer  'event_id'
    t.string   'jumbotron_file_name'
    t.string   'jumbotron_content_type'
    t.integer  'jumbotron_file_size'
    t.datetime 'jumbotron_updated_at'
  end

  add_index 'main_pages', ['event_id'], name: 'index_main_pages_on_event_id', using: :btree
  add_index 'main_pages', ['title'], name: 'index_main_pages_on_title', using: :btree

  create_table 'pending_contributors', force: :cascade do |t|
    t.integer  'event_id'
    t.integer  'user_id'
    t.string   'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reported_events', force: :cascade do |t|
    t.integer  'event_id'
    t.integer  'user_id'
    t.string   'reason'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'standards', force: :cascade do |t|
    t.string   'name'
    t.integer  'standard'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'user_name', null: false
    t.string   'role'
    t.string   'name'
    t.string   'surname'
    t.string   'company_name'
    t.datetime 'created_at',                             null: false
    t.datetime 'updated_at',                             null: false
    t.string   'email',                  default: '',    null: false
    t.string   'encrypted_password',     default: '',    null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.string   'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string   'unconfirmed_email'
    t.string   'avatar_file_name'
    t.string   'avatar_content_type'
    t.integer  'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.text     'description'
    t.boolean  'profile_access',         default: false
    t.boolean  'banned',                 default: false
  end

  add_index 'users', ['email'], name: 'index_users_on_email', unique: true, using: :btree
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  add_index 'users', ['user_name'], name: 'index_users_on_user_name', using: :btree
end
