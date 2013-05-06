class InventoryEntry < ActiveRecord::Base
  belongs_to :product
  attr_accessible :amount, :lot, :purchase_price, :sale_price
end
