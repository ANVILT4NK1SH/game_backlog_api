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

ActiveRecord::Schema[8.0].define(version: 2025_09_18_235436) do
  create_table "backlogs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "backloggable_type", null: false
    t.integer "backloggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["backloggable_type", "backloggable_id"], name: "index_backlogs_on_backloggable"
    t.index ["user_id"], name: "index_backlogs_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.string "release_date", null: false
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rawg_id", null: false
    t.index ["rawg_id"], name: "index_games_on_rawg_id", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "likeable_type", null: false
    t.integer "likeable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "owneds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ownable_type", null: false
    t.integer "ownable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_owneds_on_ownable"
    t.index ["user_id"], name: "index_owneds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "backlogs", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "owneds", "users"
end
