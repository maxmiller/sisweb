class CreateInventoryEntries < ActiveRecord::Migration
  def change
    create_table :inventory_entries do |t|
      t.references :product
      t.decimal :sale_price
      t.decimal :purchase_price
      t.integer :amount
      t.integer :lot

      t.timestamps
    end
    add_index :inventory_entries, :product_id
  end
end
