class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "商品を作成しました"
      redirect_to admin_product_path(@product.id)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品情報を更新しました"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :detail, :before_price, :genre_id, :sale_status)
  end
end
