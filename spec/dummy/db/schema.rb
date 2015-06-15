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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "speedup_dashboard_context_infos", force: :cascade do |t|
    t.integer  "context_id"
    t.string   "description"
    t.float    "duration"
    t.datetime "time"
    t.text     "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "speedup_dashboard_context_infos", ["context_id"], name: "index_speedup_dashboard_context_infos_on_context_id", using: :btree

  create_table "speedup_dashboard_contexts", force: :cascade do |t|
    t.integer  "context_uid"
    t.string   "type"
    t.string   "name"
    t.integer  "request_id"
    t.integer  "context_infos_count", default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "speedup_dashboard_contexts", ["request_id"], name: "index_speedup_dashboard_contexts_on_request_id", using: :btree

  create_table "speedup_dashboard_requests", force: :cascade do |t|
    t.string   "request_uid"
    t.datetime "time"
    t.float    "duration"
    t.string   "controller"
    t.string   "action"
    t.text     "path"
    t.boolean  "error",         default: false
    t.boolean  "xhr",           default: false
    t.string   "format",        default: "html"
    t.float    "view_duration"
    t.float    "db_duration"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "server_id"
  end

  add_index "speedup_dashboard_requests", ["server_id"], name: "index_speedup_dashboard_requests_on_server_id", using: :btree

  create_table "speedup_dashboard_servers", force: :cascade do |t|
    t.string   "name"
    t.string   "api_key"
    t.string   "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
