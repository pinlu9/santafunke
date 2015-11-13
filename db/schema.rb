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

ActiveRecord::Schema.define(version: 20151113011103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "judgments", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "elf_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "description"
    t.boolean  "naughty",           default: true
    t.string   "qualifying_adverb"
    t.string   "elf_name"
  end

  create_table "presents", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "elf_id"
    t.integer  "toy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "presents", ["toy_id"], name: "index_presents_on_toy_id", using: :btree

  create_table "toys", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.string   "type",            default: "Child"
    t.string   "address",         default: "101 St Nicholas Dr, North Pole, AK 99705", null: false
    t.integer  "age"
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_foreign_key "presents", "toys"
end
