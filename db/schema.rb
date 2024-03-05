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

ActiveRecord::Schema[7.1].define(version: 2024_02_29_082709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "avatars", force: :cascade do |t|
    t.string "name"
    t.integer "hp_level"
    t.bigint "user_id", null: false
    t.bigint "skin_color_id"
    t.bigint "shirt_id"
    t.bigint "shoes_id"
    t.bigint "pants_id"
    t.bigint "hair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coins"
    t.index ["hair_id"], name: "index_avatars_on_hair_id"
    t.index ["pants_id"], name: "index_avatars_on_pants_id"
    t.index ["shirt_id"], name: "index_avatars_on_shirt_id"
    t.index ["shoes_id"], name: "index_avatars_on_shoes_id"
    t.index ["skin_color_id"], name: "index_avatars_on_skin_color_id"
    t.index ["user_id"], name: "index_avatars_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.integer "frequency"
    t.integer "duration"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.date "date"
    t.bigint "goal_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "achieved"
    t.index ["goal_id"], name: "index_submissions_on_goal_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "avatars", "parts", column: "hair_id"
  add_foreign_key "avatars", "parts", column: "pants_id"
  add_foreign_key "avatars", "parts", column: "shirt_id"
  add_foreign_key "avatars", "parts", column: "shoes_id"
  add_foreign_key "avatars", "parts", column: "skin_color_id"
  add_foreign_key "avatars", "users"
  add_foreign_key "goals", "users"
  add_foreign_key "submissions", "goals"
  add_foreign_key "submissions", "users"
end
