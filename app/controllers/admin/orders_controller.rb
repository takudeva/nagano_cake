class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def order_status
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirmation"
      @order_items.update_all(making_status: "waiting_for_making")
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
