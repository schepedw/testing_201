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

ActiveRecord::Schema.define(version: 20150408143239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "accounts", force: :cascade do |t|
    t.float    "balance",         default: 0.0
    t.integer  "account_type_id",               null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id",                       null: false
    t.integer  "bank_id"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "house"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses_users", id: false, force: :cascade do |t|
    t.integer "address_id"
    t.integer "user_id"
  end

  add_index "addresses_users", ["address_id"], name: "index_addresses_users_on_address_id", using: :btree
  add_index "addresses_users", ["user_id"], name: "index_addresses_users_on_user_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "ssn",        null: false
    t.string  "login",      null: false
  end

  add_index "users", ["ssn"], name: "index_users_on_ssn", unique: true, using: :btree

  add_foreign_key "accounts", "account_types"
  add_foreign_key "accounts", "banks"
end
