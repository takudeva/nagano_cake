class Public::OrdersController < ApplicationController
  def new
    @shipping_addresses = ShippingAddress.all
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @shipping_address = ShippingAddress.find(params[:order][:shipping_address_id])
    # binding.pry
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @postage = 800
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
    @billing_amount = @postage + @total
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postage, :method_of_payment, :postal_code, :address, :name)
  end
end
