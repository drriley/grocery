# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130225160323) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.string   "phone"
    t.string   "street"
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "item_purchases", :force => true do |t|
    t.integer  "purchase_id"
    t.integer  "item_store_id"
    t.float    "quantity"
    t.text     "unit"
    t.float    "price_per_unit"
    t.text     "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "item_stores", :force => true do |t|
    t.integer  "item_id"
    t.integer  "store_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "generic_name"
    t.string   "storage_location"
    t.integer  "est_shelf_life"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "company_id"
    t.string   "loyalty_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "customer_id"
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "store_number"
    t.string   "phone"
    t.string   "street"
    t.string   "zip"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
