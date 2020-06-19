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

ActiveRecord::Schema.define(version: 2020_06_07_132936) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "condition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_area", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_image", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "discription", null: false
    t.integer "buyer_id"
    t.bigint "seller_id", null: false
    t.bigint "category_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "size_id", null: false
    t.bigint "condition_id", null: false
    t.bigint "delivery_price_id", null: false
    t.bigint "delivery_area_id", null: false
    t.bigint "delivery_day_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["condition_id"], name: "index_items_on_condition_id"
    t.index ["delivery_area_id"], name: "index_items_on_delivery_area_id"
    t.index ["delivery_day_id"], name: "index_items_on_delivery_day_id"
    t.index ["delivery_price_id"], name: "index_items_on_delivery_price_id"
    t.index ["seller_id"], name: "index_items_on_seller_id"
    t.index ["size_id"], name: "index_items_on_size_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.date "birth_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "shipping_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "family_name", null: false
    t.string "first_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "zip_code", null: false
    t.string "prefecuture", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "building_name"
    t.integer "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_images", "items"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "conditions"
  add_foreign_key "items", "delivery_areas"
  add_foreign_key "items", "delivery_days"
  add_foreign_key "items", "delivery_prices"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users", column: "seller_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "shipping_addresses", "users"
end
