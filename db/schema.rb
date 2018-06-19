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

ActiveRecord::Schema.define(version: 20180618163343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "Export_NYC_Order_Number",               null: false
    t.string   "Export_NYC_Order_Date",                 null: false
    t.integer  "Export_NYC_Item_Quantity",              null: false
    t.string   "Export_NYC_Item_Number",                null: false
    t.string   "Export_NYC_Item_Description",           null: false
    t.string   "Export_NYC_Contact",                    null: false
    t.string   "Export_NYC_Ship_Org",                   null: false
    t.string   "Export_NYC_Ship_Address",               null: false
    t.string   "Export_NYC_Ship_City",                  null: false
    t.string   "Export_NYC_Ship_State",                 null: false
    t.string   "Export_NYC_Ship_Zip",                   null: false
    t.string   "Export_NYC_Ship_Country",               null: false
    t.string   "Export_NYC_Ship_Phone",                 null: false
    t.string   "Export_NYC_Ship_Email",                 null: false
    t.string   "Export_NYC_Ship_Delivery_Instructions", null: false
    t.string   "Export_NYC_Bill_Org",                   null: false
    t.string   "Export_NYC_Bill_Address",               null: false
    t.string   "Export_NYC_Bill_City",                  null: false
    t.string   "Export_NYC_Bill_State",                 null: false
    t.string   "Export_NYC_Bill_Zip",                   null: false
    t.string   "Export_NYC_Bill_Country",               null: false
    t.float    "Export_NYC_Price",                      null: false
    t.string   "Export_NYC_Item_Number_two"
    t.integer  "Export_NYC_Item_Quantity_two"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "examples", "users"
end
