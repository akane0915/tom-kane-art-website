class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :description

  def new
  end

  def create
    customer = StripeTool.create_customer(
      email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: @description
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
private
  def amount_to_be_charged
    @amount = 200000
  end

  def description
    @description = "Amazing Paintings!"
  end

end
