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

ActiveRecord::Schema.define(version: 2020_05_01_160435) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "end_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "bank_name", null: false
    t.integer "account_type", null: false
    t.integer "branch_code", null: false
    t.integer "account_number", null: false
    t.string "account_holder_last_name", null: false
    t.string "account_holder_first_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "traded_products", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.string "name", null: false
    t.integer "quality_condition", null: false
    t.boolean "writing?", default: false, null: false
    t.integer "image_id", null: false
    t.integer "price", null: false
    t.integer "buyer_id", null: false
    t.integer "trading_condition", default: 0, null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "distination_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "untraded_products", force: :cascade do |t|
    t.integer "seller_id", null: false
    t.string "name", null: false
    t.integer "quality_condition", null: false
    t.boolean "writing?", default: false, null: false
    t.integer "image_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
