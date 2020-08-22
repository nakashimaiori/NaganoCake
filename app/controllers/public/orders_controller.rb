class Public::OrdersController < ApplicationController
	def index
		@orders = Order.where(current_customer)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
		@customer = current_customer
	end

	def confirm
		@customer = current_customer
		@cart_item = current_customer.cart_items
    @order = Order.new(order_params)
	end

  def create
  	@customer = current_customer
  	@order = Order.new(order_params)
		@order.save
		redirect_to public_orders_complete_path
  end

  def complete
  end

	private
	def order_params
		params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :how_pay)
		# :total_amoun, :postageは後で追加する
	end

end
