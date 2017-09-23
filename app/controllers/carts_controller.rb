class CartsController < ApplicationController

  def show
    @config = DefaultConfiguration.first
    @order_items = current_order.order_items
    @order = current_order
  end
end
