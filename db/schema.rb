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

ActiveRecord::Schema.define(version: 20131118163449) do

  create_table "addresses", force: true do |t|
    t.string  "street",   limit: 40, null: false
    t.string  "city",     limit: 40, null: false
    t.string  "county",   limit: 40, null: false
    t.string  "postcode", limit: 20, null: false
    t.integer "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "incidents", force: true do |t|
    t.date     "dateofincident", null: false
    t.integer  "valueofclaim",   null: false
    t.string   "typeofincident", null: false
    t.string   "description",    null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occupations", force: true do |t|
    t.string "name", null: false
  end

  create_table "quotations", force: true do |t|
    t.string   "identification",                   null: false
    t.integer  "quotepremium",     default: 0
    t.integer  "policyexcess",     default: 16
    t.string   "breakdowncover",                   null: false
    t.boolean  "windscreenrepair", default: false
    t.integer  "excesspaid",       default: 5
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_details", force: true do |t|
    t.string  "email",            limit: 40, null: false
    t.string  "salt",             limit: 40, null: false
    t.string  "crypted_password", limit: 40, null: false
    t.integer "user_id"
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id"

  create_table "users", force: true do |t|
    t.string   "title",                        null: false
    t.string   "firstname",                    null: false
    t.string   "surname",                      null: false
    t.integer  "phone"
    t.date     "dateofbirth",                  null: false
    t.boolean  "licencetype",   default: true
    t.string   "licenceperiod",                null: false
    t.integer  "occupation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["surname"], name: "index_users_on_surname"

  create_table "vehicles", force: true do |t|
    t.string   "registration",                null: false
    t.integer  "mileage",         default: 0
    t.integer  "value",           default: 0
    t.string   "parkinglocation",             null: false
    t.date     "policystart",                 null: false
    t.integer  "quotation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
