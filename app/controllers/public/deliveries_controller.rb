class Public::DeliveriesController < ApplicationController
  def index
  	@deliverys = Delivery.all
  	@delivery = Delivery.new
  end

  def create
  	@delivery = Delivery.new(delivery_params)
  	@delivery.customer_id = current_customer.id
  	if  @delivery.save
  	    redirect_to public_deliveries_path
  	else
  	    render action: :index
  	end
  end

  def edit
  	@delivery = Delivery.find(params[:id])
  end

  def update
  	@delivery = Delivery.find(params[:id])
  	@delivery.update(delivery_params)
  	redirect_to public_deliveries_path
  end

  def destroy
  	@delivery = Delivery.find(params[:id])
  	@delivery.destroy
  	redirect_to public_deliveries_path
  end

  private
  def delivery_params
    params.require(:delivery).permit(:postal_code, :name, :address)
  end
end
