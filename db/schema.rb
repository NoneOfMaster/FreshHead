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

ActiveRecord::Schema.define(version: 20160818231532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facts", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "batch_id"
  end

  add_index "facts", ["batch_id"], name: "index_facts_on_batch_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.text     "title"
    t.text     "abstract"
    t.text     "url"
    t.integer  "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "news", ["batch_id"], name: "index_news_on_batch_id", using: :btree

  create_table "poems", force: :cascade do |t|
    t.text    "title"
    t.text    "poet"
    t.text    "poem"
    t.integer "batch_id"
  end

  add_index "poems", ["batch_id"], name: "index_poems_on_batch_id", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.text     "author"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "batch_id"
  end

  add_index "quotes", ["batch_id"], name: "index_quotes_on_batch_id", using: :btree

  create_table "user_batches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "batch_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_progress", default: 0
    t.boolean  "complete"
  end

  add_index "user_batches", ["batch_id"], name: "index_user_batches_on_batch_id", using: :btree
  add_index "user_batches", ["user_id"], name: "index_user_batches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "user_name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "email"
    t.text     "password_digest"
    t.boolean  "admin",           default: false
  end

  add_foreign_key "facts", "batches"
  add_foreign_key "news", "batches"
  add_foreign_key "poems", "batches"
  add_foreign_key "quotes", "batches"
  add_foreign_key "user_batches", "batches"
  add_foreign_key "user_batches", "users"
end
