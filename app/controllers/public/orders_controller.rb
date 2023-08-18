class Public::OrdersController < ApplicationController
  def new
    @shipping_addresses = ShippingAddress.all
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = shipping_address.postal_code
      @order.address = shipping_address.address
      @order.name = shipping_address.last_name + shipping_address.first_name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    # binding.pry
    @postage = 800
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    @billing_amount = @postage + @total
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postage, :method_of_payment, :postal_code, :address, :name, :customer_id, :billing_amount, :status)
  end
end
