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

ActiveRecord::Schema.define(:version => 20130426183633) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cep"
    t.integer  "state_id",     :null => false
    t.string   "city"
    t.string   "cpf"
    t.string   "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "clients", ["state_id"], :name => "fk_clients_states"
  add_index "clients", ["state_id"], :name => "index_clients_on_state_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventory_entries", :force => true do |t|
    t.integer  "product_id"
    t.decimal  "sale_price",     :precision => 10, :scale => 0
    t.decimal  "purchase_price", :precision => 10, :scale => 0
    t.integer  "amount"
    t.integer  "lot"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  add_index "inventory_entries", ["product_id"], :name => "index_inventory_entries_on_product_id"

  create_table "order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_items", ["order_id"], :name => "fk_order"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], :name => "fk_product"
  add_index "order_items", ["product_id"], :name => "index_order_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "client_id"
    t.decimal  "value",         :precision => 10, :scale => 0
    t.date     "order_date"
    t.date     "delivery_date"
    t.integer  "user_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "orders", ["client_id"], :name => "fk_client"
  add_index "orders", ["client_id"], :name => "index_orders_on_client_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "orders_products", :force => true do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "amount"
  end

  add_index "orders_products", ["order_id"], :name => "index_orders_products_on_order_id"

  create_table "producers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "cnpj"
    t.string   "cpf"
    t.string   "state"
    t.string   "phone_number"
    t.string   "mobile_number"
    t.string   "email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "slug"
    t.integer  "state_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "barcode"
    t.integer  "group_id"
    t.integer  "subgroup_id"
    t.integer  "producer_id"
    t.decimal  "sale_price",  :precision => 14, :scale => 2
    t.decimal  "cost_price",  :precision => 14, :scale => 2
    t.integer  "amount"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "slug"
  end

  add_index "products", ["group_id"], :name => "index_products_on_group_id"
  add_index "products", ["producer_id"], :name => "index_products_on_producer_id"
  add_index "products", ["subgroup_id"], :name => "index_products_on_subgroup_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "subgroups", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
