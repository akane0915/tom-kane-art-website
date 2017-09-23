class DefaultConfiguration < ApplicationRecord
  after_save :update_orders

  validates_numericality_of :shipping_fee,
    greater_than_or_equal_to: 0,
    allow_nil: true

private

  def update_orders
    Order.find_each do |order|
      order.save
    end
  end
end
