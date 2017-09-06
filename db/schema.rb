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

ActiveRecord::Schema.define(version: 20170906005025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "found_items", force: :cascade do |t|
    t.integer "resolver_id"
    t.datetime "resolved_at"
    t.bigint "reception_desk_id"
    t.integer "receptionist_id"
    t.string "name"
    t.string "location_found"
    t.string "characteristic"
    t.string "finder_name"
    t.string "finder_contact"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.boolean "status"
    t.index ["reception_desk_id"], name: "index_found_items_on_reception_desk_id"
  end

  create_table "lost_items", force: :cascade do |t|
    t.integer "resolver_id"
    t.datetime "resolved_at"
    t.bigint "reception_desk_id"
    t.integer "receptionist_id"
    t.string "name"
    t.integer "kind"
    t.string "location_lost"
    t.string "characteristic"
    t.string "loser_name"
    t.string "loser_contact"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reception_desk_id"], name: "index_lost_items_on_reception_desk_id"
  end

  create_table "reception_desks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flg"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "found_items", "reception_desks"
  add_foreign_key "lost_items", "reception_desks"
end
