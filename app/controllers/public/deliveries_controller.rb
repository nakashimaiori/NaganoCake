class Public::DeliveriesController < ApplicationController

  def index
  	@delivery = Delivery.new
  end

  def create
  	@delivery = Delivery.new(delivery_params)
  	@delivery.customer_id = current_customer.id
  	if @delivery.save
       flash[:notice] = "配送先を登録しました"
  	   redirect_to public_deliveries_path
  	else
  	   render :index
  	end
  end

  def edit
  	@delivery = Delivery.find(params[:id])
  end

  def update
  	@delivery = Delivery.find(params[:id])
  	@delivery.update(delivery_params)
    flash[:notice] = "配送先を編集しました"
  	redirect_to public_deliveries_path
  end

  def destroy
  	@delivery = Delivery.find(params[:id])
  	@delivery.destroy
    flash[:notice] = "配送先を削除しました"
  	redirect_to public_deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:postal_code, :name, :address)
  end
end
