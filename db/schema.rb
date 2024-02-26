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

ActiveRecord::Schema[7.1].define(version: 2024_02_26_083504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "hp_level"
    t.bigint "hair_id"
    t.bigint "shirt_id"
    t.bigint "pants_id"
    t.bigint "shoes_id"
    t.bigint "skin_color_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hair_id"], name: "index_users_on_hair_id"
    t.index ["pants_id"], name: "index_users_on_pants_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["shirt_id"], name: "index_users_on_shirt_id"
    t.index ["shoes_id"], name: "index_users_on_shoes_id"
    t.index ["skin_color_id"], name: "index_users_on_skin_color_id"
  end

  add_foreign_key "users", "parts", column: "hair_id"
  add_foreign_key "users", "parts", column: "pants_id"
  add_foreign_key "users", "parts", column: "shirt_id"
  add_foreign_key "users", "parts", column: "shoes_id"
  add_foreign_key "users", "parts", column: "skin_color_id"
end
