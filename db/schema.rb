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

ActiveRecord::Schema.define(version: 2022_03_17_010522) do

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "clients", charset: "utf8mb4", force: :cascade do |t|
    t.string "type"
    t.string "firstname"
    t.string "lastname"
    t.string "brand"
    t.integer "employees_number"
    t.boolean "premium"
    t.integer "loyalty_points"
  end

  create_table "order_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "item_price", precision: 10, scale: 2
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.text "description"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "order_items", "orders", on_delete: :cascade
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "clients", on_delete: :cascade
  add_foreign_key "products", "categories"
end
