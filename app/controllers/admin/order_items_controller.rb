class Admin::OrderItemsController < ApplicationController

  def making_status
    order_item = OrderItem.find(params[:id])
    order_id = order_item.order_id
    order = Order.find(order_id)
    # binding.pry
    order_items = order.order_items.all
    order_item.update(order_item_params)
    if order_item.making_status == "making"
      order.update(status: "making")
    elsif order_items.all? { |order_item| order_item.making_status == "completion_of_making" }
      order.update(status: "preparing_to_ship")
    end
    redirect_to admin_order_path(order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
