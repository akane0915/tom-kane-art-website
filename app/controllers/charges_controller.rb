class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :set_description

  def new
    @charge = Charge.new
  end

  def create
    binding.pry
    customer = StripeTool.create_customer(
      email: params[:email],
      stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: @description
    )

    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
  end

private
  def amount_to_be_charged
    @amount = (current_order.calculate_total * 100).to_i
  end

  def set_description
    @description = "Some amazing product"
  end

  def charge_params
    params.require(:charge).permit(:name, :phone, :email)
  end

end
