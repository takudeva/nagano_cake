class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {
    cannot_start_making: 0,
    waiting_for_making: 1,
    making: 2,
    completion_of_making: 3
  }

end
