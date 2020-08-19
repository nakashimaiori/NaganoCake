class Public::OrdersController < ApplicationController
	def index
	end

	def show
	end

	def new
		@order = Order.new
	end

	def create
	end

	private
	def order_params
		params.require(:order).permit(:how_pay)
	end

end
