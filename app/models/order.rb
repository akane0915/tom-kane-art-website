class Order < ApplicationRecord
  has_many :order_items

  before_save :update_total

  def calculate_total
    self.order_items.collect { |item| item.painting.price }.sum
  end

private
  def update_total
    self.total_price = calculate_total
  end
end
