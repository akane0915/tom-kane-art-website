class DetailsController < ApplicationController
  def show
    slug = params[:id]
    @painting = Painting.find_by(slug: slug)
    @order_item = current_order.order_items.new
  end
end
