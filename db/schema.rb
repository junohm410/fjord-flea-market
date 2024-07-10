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

ActiveRecord::Schema[7.1].define(version: 2024_07_10_141828) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.boolean "shipping_cost_covered", null: false
    t.string "payment_method"
    t.datetime "deadline", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.bigint "buyer_id"
    t.integer "purchase_requests_count"
    t.index ["buyer_id"], name: "index_items_on_buyer_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "purchase_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchase_requests_on_item_id"
    t.index ["user_id", "item_id"], name: "index_purchase_requests_on_user_id_and_item_id", unique: true
    t.index ["user_id"], name: "index_purchase_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "provider", null: false
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "items", "users"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "purchase_requests", "items"
  add_foreign_key "purchase_requests", "users"
end
