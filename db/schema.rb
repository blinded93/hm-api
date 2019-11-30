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

ActiveRecord::Schema.define(version: 2019_11_30_031428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.bigint "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_addresses_on_property_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "payee"
    t.decimal "amount", precision: 8, scale: 2
    t.integer "account_number"
    t.boolean "recurring?"
    t.string "url"
    t.boolean "paid?"
    t.string "category"
    t.date "due_date"
    t.bigint "property_id", null: false
    t.string "name"
    t.string "frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_expenses_on_property_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.bigint "property_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_lists_on_property_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.date "due_date"
    t.boolean "completed?"
    t.string "frequency"
    t.boolean "recurring?"
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "head_of_property?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "properties"
  add_foreign_key "expenses", "properties"
  add_foreign_key "items", "lists"
  add_foreign_key "lists", "properties"
  add_foreign_key "lists", "users"
  add_foreign_key "properties", "users"
  add_foreign_key "tasks", "lists"
end
