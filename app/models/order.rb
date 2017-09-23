class Order < ApplicationRecord
  SHIPPING_FEE = Configuration.first.shipping_fee

  has_many :order_items
  has_one :charge, dependent: :destroy

  before_save :update_total
  before_save :generate_order_number

  def calculate_total
    paintings_price = self.order_items.collect { |item| item.painting.price }.sum
    paintings_price + SHIPPING_FEE
  end

private

  def update_total
    self.total_price = calculate_total
  end

  def generate_order_number
    order_number = rand(100000..999999)
    if Order.where(order_number: order_number).exists?
      assign_order_number
    end
    self.order_number = order_number
  end
end
