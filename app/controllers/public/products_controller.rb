class Public::ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  	@genres = Genre.all
  	@cart_item = CartItem.new
  end

  def index
  	@products = Product.where(sale_status: true).page(params[:page]).per(8)
  	@genres = Genre.all
  end

  def top
  	@genres = Genre.all
  end

end
