class Product < ActiveRecord::Base
  belongs_to :group
  belongs_to :subgroup
  belongs_to :producer
  attr_accessible :amount, :barcode, :code, :cost_price, :name, :sale_price, :group_id, :subgroup_id,:producer_id

  usar_como_dinheiro :cost_price, :sale_price

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name_code
    "#{self.code} - #{self.name}"
  end

end
