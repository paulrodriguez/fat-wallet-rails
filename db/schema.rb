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

ActiveRecord::Schema.define(version: 20170528013745) do

  create_table "transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "transaction_date"
    t.decimal  "grand_total",      precision: 10, scale: 2
    t.decimal  "subtotal",         precision: 10, scale: 2
    t.decimal  "tax_total",        precision: 10, scale: 2
    t.decimal  "discount_total",   precision: 10, scale: 2
    t.decimal  "tax_rate",         precision: 10, scale: 2
    t.integer  "user_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["user_id"], name: "index_transactions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",      limit: 100
    t.string   "username",   limit: 50
    t.string   "password",   limit: 200
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "salt"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
