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

ActiveRecord::Schema.define(version: 20150308042405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.boolean  "is_paid",    default: false
    t.float    "total",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "tip",        default: 0.0
    t.float    "subtotal",   default: 0.0
    t.integer  "custom_id"
    t.boolean  "payable",    default: false
    t.string   "pass_key"
  end

  create_table "customs", force: true do |t|
    t.string   "canvas_size"
    t.text     "info"
    t.string   "email"
    t.string   "name"
    t.string   "pass_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.boolean  "notify",      default: true
  end

  create_table "messages", force: true do |t|
    t.string   "author"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "custom_id"
    t.string   "image"
  end

end
