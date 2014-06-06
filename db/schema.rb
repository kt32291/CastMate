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

ActiveRecord::Schema.define(version: 20140605185528) do

  create_table "auditions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "theatre_id"
    t.boolean  "equity"
    t.date     "audition_start"
    t.date     "audition_end"
    t.integer  "play_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "role_id"
    t.integer  "theatre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "plays", force: true do |t|
    t.string   "title"
    t.string   "type_of_show"
    t.string   "author"
    t.string   "music_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publix"
  end

  create_table "roles", force: true do |t|
    t.string   "character_name"
    t.integer  "play_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "publix"
  end

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "audition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theatres", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "theatre_type"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "equity"
    t.string   "gender"
    t.integer  "height"
    t.integer  "weight"
    t.string   "hair"
    t.string   "eyes"
    t.string   "vocal_range"
    t.string   "headshot"
    t.string   "resume"
    t.string   "theatre"
    t.integer  "theatre_id"
    t.string   "ethnic_appearance"
    t.string   "agency"
    t.string   "phone"
    t.text     "special_skills"
    t.string   "age_range"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
