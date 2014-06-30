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

ActiveRecord::Schema.define(version: 20140630220030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "description", null: false
    t.integer  "prayer_id",   null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "groups", force: true do |t|
    t.string "name", null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "member_requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "accepted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "members", ["user_id", "group_id"], name: "index_members_on_user_id_and_group_id", unique: true, using: :btree

  create_table "prayers", force: true do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider",                          null: false
    t.string   "uid",                               null: false
    t.string   "name",                              null: false
    t.string   "email",                             null: false
    t.string   "image",                             null: false
    t.string   "location"
    t.string   "oauth_token",                       null: false
    t.datetime "oauth_expires_at",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",             default: "user", null: false
  end

  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

end
