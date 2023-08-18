class Public::OrdersController < ApplicationController
  def new
    @shipping_addresses = ShippingAddress.all
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end
end
