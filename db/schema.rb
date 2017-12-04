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

ActiveRecord::Schema.define(version: 20161103015606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "copies", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "acquisition_date"
    t.string   "url"
    t.integer  "edition_id"
    t.integer  "format_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["edition_id"], name: "index_copies_on_edition_id", using: :btree
    t.index ["format_id"], name: "index_copies_on_format_id", using: :btree
    t.index ["user_id"], name: "index_copies_on_user_id", using: :btree
  end

  create_table "editions", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "publisher_id"
    t.integer  "publication_year"
    t.string   "isbn10"
    t.string   "isbn13"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["publisher_id"], name: "index_editions_on_publisher_id", using: :btree
    t.index ["work_id"], name: "index_editions_on_work_id", using: :btree
  end

  create_table "formats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendrequests", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id"], name: "index_friendrequests_on_recipient_id", using: :btree
    t.index ["sender_id"], name: "index_friendrequests_on_sender_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "copy_id"
    t.integer  "status_code"
    t.date     "checkout_date"
    t.date     "return_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["copy_id"], name: "index_loans_on_copy_id", using: :btree
    t.index ["user_id"], name: "index_loans_on_user_id", using: :btree
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_works_on_author_id", using: :btree
  end

  add_foreign_key "copies", "editions"
  add_foreign_key "copies", "formats"
  add_foreign_key "copies", "users"
  add_foreign_key "editions", "publishers"
  add_foreign_key "editions", "works"
  add_foreign_key "loans", "copies"
  add_foreign_key "loans", "users"
  add_foreign_key "works", "authors"
end
