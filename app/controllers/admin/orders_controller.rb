class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order.update(order_params)

      #　publicとマージしてから確認！

      #入金待ちのときは製作ステータスに着手不可が入る
      #入金確認のとき製作ステータスを全て”製作待ち”に更新

      if @order.order_status == "入金待ち"
        @order_items.update_all(made_status: "着手不可")
      else
        @order.order_status == "入金確認"
        @order_items.update_all(made_status: "製作待ち")
      end

    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:receive_postal_code, :receive_address, :receive_name, :total_amount, :how_pay, :postage, :order_status)
  end
end
