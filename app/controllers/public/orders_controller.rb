class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items


	def new
  	@customer = current_customer
		@order = Order.new
		@deliveries = Delivery.all
	end

	def confirm
		# binding.pry
		@customer = current_customer
		@cart_item = current_customer.cart_items
		@order = Order.new(order_params)
		if params[:order][:abc] == "a"
			@order.receive_postal_code = @customer.postal_code
			@order.receive_address = @customer.address
			@order.receive_name = @customer.last_name + @customer.first_name
		elsif params[:order][:abc] == "b"
			@delivery = Delivery.find(params[:select_delivery][:id])
			@order.receive_postal_code = @delivery.postal_code
			@order.receive_address = @delivery.address
			@order.receive_name = @delivery.name
		elsif params[:order][:abc] == "c"
			@order.receive_postal_code = params[:order][:new_postal_code]
			@order.receive_address = params[:order][:new_address]
			@order.receive_name = params[:order][:new_name]
		end
	end

  def create
  	@order = Order.new(order_params)
  	@customer = current_customer
	@order.save
	redirect_to public_orders_complete_path
  end

  def complete
  end

	private
	def order_params
		# binding.pry
		params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :how_pay, :postage, :total_amount)
	end

end
