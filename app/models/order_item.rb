class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item, optional: true

  enum making_status: {
    cannot_start_making: 0,
    waiting_for_making: 1,
    making: 2,
    completion_of_making: 3
  }

  def total_amount
    order_items = self.all
    order_items.inject(0) { |sum, order_item| sum + order_item.amount }
  end

  def subtotal
    self.purchase_price * self.amount
  end

end
