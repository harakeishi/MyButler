# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_033605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acquaintances", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_acquaintances_on_name"
    t.index ["user_id"], name: "index_acquaintances_on_user_id"
  end

  create_table "memos", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stories", force: :cascade do |t|
    t.string "content"
    t.integer "acquaintancesid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "pwd"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "acquaintances", "users"
end
