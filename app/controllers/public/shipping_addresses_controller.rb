class Public::ShippingAddressesController < ApplicationController

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      flash[:notice] = "アドレスは適切に登録されました"
      redirect_to shipping_addresses_path
    else
      flash[:notice] = "アドレスの登録に失敗しました"
      @shipping_address = ShippingAddress.new
      @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
      render "index"
    end
  end

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to shipping_addresses_path
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :postal_code, :address, :name)
  end

end
