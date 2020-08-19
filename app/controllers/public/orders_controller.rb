class Public::OrdersController < ApplicationController
	def index
		@orders = Order.where(current_customer)
	end

	def show
		@order = 1
	end

	def new
		@order = Order.new
	end

	def confirm
	  @order = Order.new(order_params)
	  render :new if @order.invalid?
	end

  def create
  	@order = Order.new(order_params)
		@order.save
		redirect_to public_orders_complete_path
  end

	private
	def order_params
		params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :how_pay, :total_amoun, :postage)
	end

end
