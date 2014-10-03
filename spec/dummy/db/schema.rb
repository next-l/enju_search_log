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

ActiveRecord::Schema.define(version: 20140811132912) do

  create_table "agent_merge_lists", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agent_merges", force: true do |t|
    t.integer  "agent_id",            null: false
    t.integer  "agent_merge_list_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agent_merges", ["agent_id"], name: "index_agent_merges_on_agent_id"
  add_index "agent_merges", ["agent_merge_list_id"], name: "index_agent_merges_on_agent_merge_list_id"

  create_table "library_groups", force: true do |t|
    t.string   "name",                                              null: false
    t.text     "display_name"
    t.string   "short_name",                                        null: false
    t.string   "email"
    t.text     "my_networks"
    t.text     "login_banner"
    t.text     "note"
    t.integer  "country_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "admin_networks"
    t.string   "url",            default: "http://localhost:3000/"
  end

  add_index "library_groups", ["short_name"], name: "index_library_groups_on_short_name"

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_group_id"
    t.integer  "library_id"
    t.string   "locale"
    t.string   "user_number"
    t.text     "full_name"
    t.text     "note"
    t.text     "keyword_list"
    t.integer  "required_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.boolean  "save_search_history"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"
  add_index "profiles", ["user_number"], name: "index_profiles_on_user_number", unique: true

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_histories", force: true do |t|
    t.integer  "user_id"
    t.string   "operation",                      default: "searchRetrieve"
    t.float    "sru_version",                    default: 1.2
    t.string   "query"
    t.integer  "start_record"
    t.integer  "maximum_records"
    t.string   "record_packing"
    t.string   "record_schema"
    t.integer  "result_set_ttl"
    t.string   "stylesheet"
    t.string   "extra_request_data"
    t.integer  "number_of_records",              default: 0
    t.string   "result_set_id"
    t.integer  "result_set_idle_time"
    t.text     "records"
    t.integer  "next_record_position"
    t.text     "diagnostics"
    t.text     "extra_response_data"
    t.text     "echoed_search_retrieve_request"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_histories", ["user_id"], name: "index_search_histories_on_user_id"

  create_table "series_statement_merge_lists", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series_statement_merges", force: true do |t|
    t.integer  "series_statement_id",            null: false
    t.integer  "series_statement_merge_list_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "series_statement_merges", ["series_statement_id"], name: "index_series_statement_merges_on_series_statement_id"
  add_index "series_statement_merges", ["series_statement_merge_list_id"], name: "index_series_statement_merges_on_list_id"

  create_table "user_has_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "user_group_id"
    t.integer  "required_role_id"
    t.string   "username"
    t.text     "note"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.boolean  "save_search_history",    default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
