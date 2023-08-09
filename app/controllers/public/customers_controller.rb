class Public::CustomersController < ApplicationController
  def my_page
    @customer = current_customer
  end

  def confirm
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleated: true)
    reset_session
    redirect_to "/"
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
