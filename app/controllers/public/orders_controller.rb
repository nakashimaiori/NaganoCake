class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end


	def new
  	@customer = current_customer
		@order = Order.new
		@deliveries = current_customer.deliveries
	end

	def confirm
		@customer = current_customer
		@cart_item = current_customer.cart_items
		@order = Order.new(order_params)
		# 「ご自身の住所」を選択した場合
		if params[:order][:select_address] == "customer_address"
			@order.receive_postal_code = @customer.postal_code
			@order.receive_address = @customer.address
			@order.receive_name = @customer.last_name + @customer.first_name
		# 「登録済住所から選択」を選択した場合
		elsif params[:order][:select_address] == "deliverey_address"
			@delivery = Delivery.find(params[:select_delivery][:id])
			@order.receive_postal_code = @delivery.postal_code
			@order.receive_address = @delivery.address
			@order.receive_name = @delivery.name
		# 「新しいお届け先」を選択した場合
		elsif params[:order][:select_address] == "new_deliverey_address"
			@delivery = Delivery.new
			@delivery.postal_code = params[:order][:new_postal_code]
			@delivery.address = params[:order][:new_address]
			@delivery.name = params[:order][:new_name]
			@delivery.customer_id = current_customer.id
			@delivery.save

			@order.receive_postal_code = @delivery.postal_code
			@order.receive_address = @delivery.address
			@order.receive_name = @delivery.name
		end
	end

  def create
  	params[:order][:how_pay] = params[:order][:how_pay].to_i
  	@order = Order.new(order_params)
  	@order.customer_id = current_customer.id
		@order.save

		current_customer.cart_items.each do |cart_item|
		  @order_item = OrderItem.new
			@order_item.order_id = @order.id
		  @order_item.product_id = cart_item.product_id
		  @order_item.qty = cart_item.item_qty
		  @order_item.after_price = cart_item.product.tax_price
		  @order_item.save
		end

		current_customer.cart_items.destroy_all
		redirect_to public_orders_complete_path
  end

  def complete
  end

	private

	def order_params
		params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :how_pay, :postage, :total_amount)
	end

end
