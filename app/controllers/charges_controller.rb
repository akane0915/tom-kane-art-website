class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :set_description

  def new
    @charge = Charge.new
    @order = current_order
  end

  def create
    @order = current_order
    @charge = @order.build_charge(charge_params)
    if @charge.save
      redirect_to review_order_path(id: @order.charge)
    else
      render :new
    end
  end

  def review
    @charge = Charge.find(params[:id])
    @order = @charge.order
    render :review_order
  end

  def submit
    customer = StripeTool.create_customer(
      current_order.charge.email,
      params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer.id,
      @amount,
      @description,
      current_order.charge.email
    )

    current_order.order_items.each do |order_item|
      painting_id = order_item.painting_id
      painting = Painting.find(painting_id)
      amount_to_be_charged
      painting.update(status: "unavailable", price: 1000000)
    end

    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_back fallback_location: review_order_path(id: current_order.charge)
  end

  def thanks
    set_description
    session[:order_id] = nil
  end

private
  def amount_to_be_charged
    @amount = (current_order.calculate_total * 100).to_i
  end

  def set_description
    @description = current_order.order_number
  end

  def charge_params
    params.require(:charge).permit(
      :name,
      :email,
      :phone,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :country,
    )
  end

end
