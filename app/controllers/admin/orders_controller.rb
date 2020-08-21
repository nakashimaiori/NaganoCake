class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order.id)
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :total_amount, :how_pay, :postage, :order_status)
  end
end