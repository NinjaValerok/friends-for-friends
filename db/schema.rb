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

ActiveRecord::Schema.define(version: 20170708163259) do

  create_table "feeds", force: :cascade do |t|
    t.text     "message"
    t.string   "external_id"
    t.string   "provider"
    t.string   "type"
    t.string   "author_uid"
    t.string   "provider_type"
    t.datetime "provider_created_at"
    t.datetime "provider_updated_at"
    t.integer  "author_id"
    t.datetime "created_at"
    t.index ["author_id"], name: "index_feeds_on_author_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nick_name"
    t.string   "phone"
    t.string   "avatar"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nick_name"], name: "index_users_on_nick_name", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
  end

end
