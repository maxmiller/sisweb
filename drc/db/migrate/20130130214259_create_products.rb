class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.string :barcode
      t.references :group
      t.references :subgroup
      t.references :producer
      t.decimal :sale_price,   :precision => 14, :scale => 2
      t.decimal :cost_price,   :precision => 14, :scale => 2
      t.integer :amount

      t.timestamps
    end
    add_index :products, :group_id
    add_index :products, :subgroup_id
    add_index :products, :producer_id
  end
end
