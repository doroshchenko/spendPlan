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

ActiveRecord::Schema.define(version: 20170822134550) do

  create_table "password_resets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_password_resets_on_user_id"
  end

  create_table "spend_categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "is_default"
    t.integer  "default_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "spend_category_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "spend_category_id"
    t.integer  "amount"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["spend_category_id"], name: "index_spend_category_users_on_spend_category_id"
    t.index ["user_id"], name: "index_spend_category_users_on_user_id"
  end

  create_table "user_incomes", force: :cascade do |t|
    t.string   "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_incomes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
