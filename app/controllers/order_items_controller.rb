class OrderItemsController < ApplicationController

  def create
    @order = current_order
    binding.pry
    @item = @order.order_items.new(item_params)
    # @item.order_id = current_order.id
    # @order.order_items.push(@item)
    @order.save
    session[:order_id] = @order.id
    redirect_to home_path #maybe something else...
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:painting_id)
  end
end
