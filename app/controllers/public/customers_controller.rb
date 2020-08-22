class Public::CustomersController < ApplicationController
  def show
  	@customer = Customer.find(current_customer.id)
  end

  def cancel
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_status: "退会済")
    reset_session
    flash[:notice] = "またのご利用お待ちしております。"
    redirect_to root_path
  end

  def edit
  	@customer = Customer.find(current_customer.id)
  end

  def update
  end

end
