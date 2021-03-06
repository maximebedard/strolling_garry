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

ActiveRecord::Schema.define(version: 20141119223059) do

  create_table "addresses", force: true do |t|
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.integer  "number"
    t.string   "street"
    t.string   "city"
    t.string   "province",         default: "Quebec"
    t.string   "country",          default: "Canada"
    t.string   "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "elevation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "estimated_delivery_time"
    t.string   "delivery_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_paths", id: false, force: true do |t|
    t.integer "path_id"
    t.integer "client_id"
  end

  create_table "paths", force: true do |t|
    t.integer  "user_id"
    t.integer  "branch_id"
    t.string   "path_type"
    t.string   "name"
    t.string   "mode",          default: "car"
    t.date     "date"
    t.float    "distance"
    t.time     "distance_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paths_potential_clients", id: false, force: true do |t|
    t.integer "path_id"
    t.integer "potential_client_id"
  end

  create_table "potential_clients", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "time_spent"
    t.string   "marketing_agent_name"
    t.string   "decision"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
