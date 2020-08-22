class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order  #注文ステータスを更新するため、ordersテーブル呼び出し
    @order_item.update(order_item_params)

    #　publicとマージしてから確認！

      #製作ステータスの状態によって条件分岐

      if @order_item.made_status == "製作中"
        @order.update(order_status: "製作中")  #もし製作ステータスが1つでも製作中であれば、注文ステータスを製作中に更新
      elsif  @order.order_items.count == @order.order_items.where(made_status: "製作完了").count
        @order.update(order_status: "発送準備中")  #注文数と製作完了数が一致したとき、注文ステータスを発送準備中に更新
      end

    redirect_to admin_order_path(@order.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:made_status)
  end
end
