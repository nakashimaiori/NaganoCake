class Public::OrdersController < ApplicationController
	def index
		@orders = Order.where(current_customer)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
  		@customer = current_customer
		@order = Order.new
	end

	def confirm
		@customer = current_customer
		@cart_item = current_customer.cart_items
  		@order = Order.new(order_params)
		if @order.abc = "a"
  			@order.receive_postal_code = @customer.postal_code
  			@order.receive_address = @customer.address
  			@order.receive_name = @customer.last_name + @customer.first_name
  		else @order.abc = "b"
  			@delivery = Delivery.find(@order.delivery_id)
  			@order.receive_postal_code = @delivery.postal_code
  			@order.receive_address = @delivery.address
  			@order.receive_name = @delivery.name
  		end

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
