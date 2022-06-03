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

ActiveRecord::Schema[7.0].define(version: 2022_06_03_012419) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "likes", default: 0
    t.bigint "user_id"
    t.bigint "publish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publish_id"], name: "index_comments_on_publish_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "publishes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "published_at", precision: nil
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_publishes_on_user_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "cellphone", default: "0"
    t.string "first_name", default: "0"
    t.string "second_name", default: "0"
    t.string "last_name", default: "0"
    t.string "nickname"
    t.string "document_type", default: "0"
    t.string "document_number", default: "0"
    t.string "country", default: "0"
    t.string "dress", default: "0"
    t.integer "state", default: 1
    t.date "birtdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "publishes"
  add_foreign_key "comments", "users"
  add_foreign_key "publishes", "users"
end
