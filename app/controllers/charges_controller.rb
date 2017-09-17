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
      painting.update_attribute(:status, "sold")
    end

    MessageMailer.contact(sold_message).deliver_now

    redirect_to thanks_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_back fallback_location: review_order_path(id: current_order.charge)
  end

  def thanks
    amount_to_be_charged
    set_description
    session[:order_id] = nil
  end

private
  def amount_to_be_charged
    @amount = (current_order.calculate_total * 100).to_i
  end

  def set_item_names
    painting_names = []
    current_order.order_items.each do |order_item|
      painting = Painting.find(order_item.painting_id)
      painting_names.push(painting.title)
    end
    painting_names.join(", ")
  end

  def set_description
    @description = "#{current_order.order_number} - #{'Painting'.pluralize(current_order.order_items.count)}: #{set_item_names}"
  end

  def sold_message
    Message.new(
      name: "TomKaneArt.com",
      email: "sold@tomkaneart.com",
      subject: "Order Number: #{current_order.order_number}",
      body: <<~MESSAGE
        You sold a painting!
        
        #{'Painting'.pluralize(current_order.order_items.count)}: #{set_item_names}
        Order Total: #{current_order.total_price}

        Customer Details:

        #{current_order.charge.name}
        #{current_order.charge.email}
        #{current_order.charge.phone}
        #{current_order.charge.address1}
        #{current_order.charge.address2}
        #{current_order.charge.city}, #{current_order.charge.state} #{current_order.charge.zip}
        #{current_order.charge.country}

      MESSAGE
    )
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
