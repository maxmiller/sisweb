class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client
      t.decimal :value
      t.date :order_date
      t.date :delivery_date
      t.references :user

      t.timestamps
    end

    create_table :orders_products do |t|
      t.references :order
      t.references :product
      t.integer :amount
    end
    add_index :orders, :client_id
    add_index :orders, :user_id
    add_index :orders_products, :order_id
  end
end
