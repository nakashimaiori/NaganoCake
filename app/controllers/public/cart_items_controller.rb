class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items.all
  end

  def create
    @customer = current_customer
    @cart_item = @customer.cart_items.new(cart_item_params)
  end

  def update
    @customer = current_customer
    ＠cart_item = CartItem.find(params[:id])
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @customer = current_customer
    @customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :customer_id, :item_qty)
  end

end
