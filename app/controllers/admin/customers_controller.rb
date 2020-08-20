class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  private
  def customer_params
  	prams.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :customer_status)
  end
end
