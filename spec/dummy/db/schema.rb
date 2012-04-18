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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120418121539) do

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "display_name"
    t.text     "note"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_histories", :force => true do |t|
    t.integer  "user_id"
    t.string   "operation",                      :default => "searchRetrieve"
    t.float    "sru_version",                    :default => 1.2
    t.string   "query"
    t.integer  "start_record"
    t.integer  "maximum_records"
    t.string   "record_packing"
    t.string   "record_schema"
    t.integer  "result_set_ttl"
    t.string   "stylesheet"
    t.string   "extra_request_data"
    t.integer  "number_of_records",              :default => 0
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

  add_index "search_histories", ["user_id"], :name => "index_search_histories_on_user_id"

  create_table "user_has_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "user_group_id"
    t.integer  "required_role_id"
    t.string   "username"
    t.text     "note"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "save_search_history"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
