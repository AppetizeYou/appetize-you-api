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

ActiveRecord::Schema.define(version: 2022_07_18_141641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cooking_method_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "main_ingredient_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.bigint "previous_message_id"
    t.index ["previous_message_id"], name: "index_messages_on_previous_message_id"
    t.index ["recipient_id"], name: "index_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "occasion_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "serve", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "author_id", null: false
    t.bigint "type_category_id", null: false
    t.bigint "occasion_category_id", null: false
    t.bigint "main_ingredient_category_id", null: false
    t.bigint "cooking_method_category_id", null: false
    t.text "cooking_order", default: [], array: true
    t.string "ingredient", default: [], array: true
    t.index ["author_id"], name: "index_recipes_on_author_id"
    t.index ["cooking_method_category_id"], name: "index_recipes_on_cooking_method_category_id"
    t.index ["main_ingredient_category_id"], name: "index_recipes_on_main_ingredient_category_id"
    t.index ["occasion_category_id"], name: "index_recipes_on_occasion_category_id"
    t.index ["type_category_id"], name: "index_recipes_on_type_category_id"
  end

  create_table "type_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "messages", "messages", column: "previous_message_id"
  add_foreign_key "messages", "users", column: "recipient_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "recipes", "cooking_method_categories"
  add_foreign_key "recipes", "main_ingredient_categories"
  add_foreign_key "recipes", "occasion_categories"
  add_foreign_key "recipes", "type_categories"
  add_foreign_key "recipes", "users", column: "author_id"
end
