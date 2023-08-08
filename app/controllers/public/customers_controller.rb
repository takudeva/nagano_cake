class Public::CustomersController < ApplicationController
  def my_page
    @customer = current_customer
  end

  def confirm
  end

  def edit
  end
end
