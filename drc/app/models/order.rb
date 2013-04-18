class Order < ActiveRecord::Base
  belongs_to :client

  has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, :allow_destroy => true

  attr_accessible :delivery_date, :order_date, :value, :client_id, :client


  def total_order
    total = 0
    self.order_items.each  do |p|
        total += p.product.sale_price * p.amount
    end
    total
  end

end
