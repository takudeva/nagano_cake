class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer


  def subtotal
    item.add_tax_price * self.amount
  end

end
