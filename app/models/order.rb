class Order < ApplicationRecord
  belongs_to :customer

  enum method_of_payment: { credit: 0, bank: 1 }
  enum status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    making: 2,
    preparing_to_ship: 3,
    shipped: 4
  }
end
