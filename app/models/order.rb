class Order < ApplicationRecord
  has_many :order_items
  has_one :charge, dependent: :destroy

  # validates :order_number, presence: true

  before_save :update_total
  before_save :generate_order_number
  # before_create :update_status

  def calculate_total
    self.order_items.collect { |item| item.painting.price }.sum
  end

private


# Set order status upon creation
  # def update_status
  #   if self.status == nil?
  #     self.status = "In progress"
  #   end
  # end

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
