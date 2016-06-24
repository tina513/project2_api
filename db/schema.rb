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

ActiveRecord::Schema.define(version: 20160623185730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "examples", ["user_id"], name: "index_examples_on_user_id", using: :btree

  create_table "flights", force: :cascade do |t|
    t.string   "flight_number"
    t.date     "departure_date"
    t.string   "departure_time"
    t.string   "departure"
    t.date     "arrival_date"
    t.string   "arrival_time"
    t.string   "arrival"
    t.integer  "arrival_zipcode"
    t.string   "gate"
    t.string   "terminal"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trips", ["flight_id"], name: "index_trips_on_flight_id", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "examples", "users"
  add_foreign_key "trips", "flights"
  add_foreign_key "trips", "users"
end
