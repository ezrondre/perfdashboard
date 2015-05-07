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

ActiveRecord::Schema.define(version: 20150421222753) do

  create_table "perfdashboard_context_infos", force: :cascade do |t|
    t.integer  "context_id",  limit: 4
    t.string   "description", limit: 255
    t.float    "duration",    limit: 24
    t.datetime "time"
    t.text     "data",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "perfdashboard_context_infos", ["context_id"], name: "index_perfdashboard_context_infos_on_context_id", using: :btree

  create_table "perfdashboard_contexts", force: :cascade do |t|
    t.integer  "context_uid",        limit: 4
    t.string   "type",               limit: 255
    t.string   "name",               limit: 255
    t.integer  "request_id",         limit: 4
    t.integer  "context_data_count", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "perfdashboard_contexts", ["request_id"], name: "index_perfdashboard_contexts_on_request_id", using: :btree

  create_table "perfdashboard_requests", force: :cascade do |t|
    t.string   "request_uid",   limit: 255
    t.datetime "time"
    t.float    "duration",      limit: 24
    t.string   "controller",    limit: 255
    t.string   "action",        limit: 255
    t.text     "path",          limit: 65535
    t.boolean  "error",         limit: 1,     default: false
    t.boolean  "xhr",           limit: 1,     default: false
    t.string   "format",        limit: 255,   default: "html"
    t.float    "view_duration", limit: 24
    t.float    "db_duration",   limit: 24
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "server_id",     limit: 4
  end

  add_index "perfdashboard_requests", ["server_id"], name: "index_perfdashboard_requests_on_server_id", using: :btree

  create_table "perfdashboard_servers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "api_key",    limit: 255
    t.string   "host",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
