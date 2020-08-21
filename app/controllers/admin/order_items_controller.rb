class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    redirect_to admin_order_path(@order_item.id)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:made_status)
  end
end
