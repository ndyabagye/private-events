# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_13_120532) do
  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.datetime "date"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_events_on_creator_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "status"
    t.integer "event_id", null: false
    t.integer "user_id", null: false
    t.integer "host_id"
    t.integer "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_invites_on_event_id"
    t.index ["host_id"], name: "index_invites_on_host_id"
    t.index ["invitee_id"], name: "index_invites_on_invitee_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "users", column: "creator_id"
  add_foreign_key "invites", "events"
  add_foreign_key "invites", "users"
  add_foreign_key "invites", "users", column: "host_id"
  add_foreign_key "invites", "users", column: "invitee_id"
end
