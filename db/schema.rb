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

ActiveRecord::Schema[7.0].define(version: 2024_05_14_132557) do
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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone_number"
    t.string "subject", null: false
    t.string "content", null: false
    t.string "prefecture"
    t.string "address"
    t.integer "is_read", default: 0, null: false
    t.integer "user_id", null: false
    t.integer "type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_favorites_on_tweet_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_managers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true
  end

  create_table "sauna_comments", force: :cascade do |t|
    t.text "comment", default: ""
    t.integer "user_id"
    t.integer "sauna_id"
    t.integer "aufguss", default: 0
    t.integer "autorolly", default: 0
    t.integer "air_bath", default: 0
    t.integer "whisking", default: 0
    t.integer "restaurant", default: 0
    t.integer "water", default: 0
    t.integer "parking", default: 0
    t.integer "age", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sauna_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sauna_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sauna_infos", force: :cascade do |t|
    t.integer "temperature", null: false
    t.integer "sauna_id"
    t.string "express"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sauna_id"], name: "index_sauna_infos_on_sauna_id"
  end

  create_table "saunas", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.text "express", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweet_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.integer "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sauna_id", null: false
    t.integer "count", default: 0, null: false
    t.text "impression", default: "", null: false
    t.integer "sauna_time", default: 3, null: false
    t.float "water_time", default: 0.167, null: false
    t.integer "totonoi_time", default: 5, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sauna_id"], name: "index_tweets_on_sauna_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "introduction"
    t.integer "count", default: 0, null: false
    t.boolean "is_unsubscribed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waters", force: :cascade do |t|
    t.integer "temperature", null: false
    t.integer "sauna_id"
    t.string "express"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sauna_id"], name: "index_waters_on_sauna_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "tweets"
  add_foreign_key "favorites", "users"
  add_foreign_key "sauna_infos", "saunas"
  add_foreign_key "tweets", "saunas"
  add_foreign_key "tweets", "users"
  add_foreign_key "waters", "saunas"
end
