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

ActiveRecord::Schema.define(version: 2019_12_24_072435) do

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.integer "age"
    t.text "politics"
    t.integer "votes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vote_log_count", default: 0
  end

  create_table "cluster_groups", force: :cascade do |t|
    t.integer "cluster_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clusters", force: :cascade do |t|
    t.string "cluster_no"
    t.string "name"
    t.string "remark"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concentrator_meters", force: :cascade do |t|
    t.integer "concentrator_id"
    t.integer "meter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concentrators", force: :cascade do |t|
    t.integer "concentrator_no"
    t.string "concentrator_name"
    t.string "concentrator_status", default: "再用"
    t.string "concentrator_zxstatus", default: "离线"
    t.string "creator"
    t.string "install_addr"
    t.time "last_ctime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["concentrator_no"], name: "index_concentrators_on_concentrator_no", unique: true
  end

  create_table "concentrators_meters", id: false, force: :cascade do |t|
    t.integer "concentrator_id"
    t.integer "meter_id"
    t.index ["concentrator_id"], name: "index_concentrators_meters_on_concentrator_id"
    t.index ["meter_id"], name: "index_concentrators_meters_on_meter_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "idcard"
    t.string "mobile"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group_no"
    t.integer "user_id"
  end

  create_table "meters", force: :cascade do |t|
    t.string "errorinfo"
    t.date "last_readtime"
    t.integer "meter_brand"
    t.string "remark"
    t.integer "one_valve", default: 0
    t.integer "two_valve", default: 0
    t.integer "one_valve_status", default: 0
    t.integer "two_valve_status", default: 0
    t.float "battery_voltage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "meter_no"
    t.integer "user_id"
    t.integer "isbinded", default: 0
    t.index ["meter_no"], name: "index_meters_on_meter_no", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vote_logs", force: :cascade do |t|
    t.integer "candidate_id"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_vote_logs_on_candidate_id"
  end

  create_table "welcomes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
