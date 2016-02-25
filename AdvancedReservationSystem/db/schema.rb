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

ActiveRecord::Schema.define(version: 20150818224030) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "airlines", force: :cascade do |t|
    t.string   "name"
    t.string   "iata"
    t.string   "icao"
    t.string   "callsign"
    t.string   "headquarters"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attractions", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_reservations", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "customer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "eventdate"
    t.string   "arrival_airport_id"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "extra_reservations", force: :cascade do |t|
    t.string   "user_id"
    t.string   "hotel_list_id",      default: "Not Specified"
    t.string   "room"
    t.datetime "checkin"
    t.datetime "checkout"
    t.string   "availability"
    t.string   "arrival_airport_id", default: "Not Specified"
    t.string   "otherdestination"
    t.datetime "pickup"
    t.integer  "numberofpassanger"
    t.string   "attraction_id",      default: "Not Specified"
    t.string   "dayoftheweek"
    t.string   "tour_id",            default: "Not Specified"
    t.integer  "numberoftourist"
    t.string   "restaurant_id",      default: "Not Specified"
    t.datetime "visitingdate"
    t.integer  "numberofguest"
    t.string   "specialrequirement"
    t.text     "additionalinfo"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "airline_id"
    t.integer  "departure_airport_id"
    t.integer  "arrival_airport_id"
    t.datetime "departure_date"
    t.integer  "duration"
    t.float    "price"
    t.string   "availability"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "hotel_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.integer  "arrival_airport_id"
    t.string   "room"
    t.datetime "checkin"
    t.datetime "checkout"
    t.float    "price"
    t.string   "availability"
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxis", force: :cascade do |t|
    t.integer  "arrival_airport_id"
    t.integer  "hotel_id"
    t.integer  "flight_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
