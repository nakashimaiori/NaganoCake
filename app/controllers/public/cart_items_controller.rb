class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @cart_items = @customer.cart_items.all
  end

  def create
    @customer = current_customer
    @cart_item = @customer.cart_items.new(cart_item_params)
    # 以前に追加した商品の情報(すでにカートにある商品)↓
    @now_cart_item = current_customer.cart_items.find_by(product_id: @cart_item.product_id)
    if @now_cart_item
       @now_cart_item.item_qty += @cart_item.item_qty
        # 数量をさらにupdate
       @now_cart_item.update(item_qty: @now_cart_item.item_qty)
       redirect_to public_cart_items_path
    else
      if @cart_item.save
         redirect_to public_cart_items_path
      else
         flash[:notice] = "カートに入れる個数を入力してください"
         redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    # @customer = current_customer
    # ＠cart_item = CartItem.find(params[:id])
    # @cart_item.update(cart_item_params)
    # redirect_to redirect_to public_cart_items_path
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @customer = Customer.find(current_customer.id)
    redirect_to public_cart_items_path
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
