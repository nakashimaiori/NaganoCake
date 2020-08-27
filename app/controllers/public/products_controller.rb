class Public::ProductsController < ApplicationController
  def show
  	@product = Product.find(params[:id])
  	@genres = Genre.where(status: true)
  	@cart_item = CartItem.new
  end

  def index
  	@products = Product.where(sale_status: true).page(params[:page]).per(8)
  	@genres = Genre.where(status: true)
  end

  def top
  	@genres = Genre.where(status: true)
  end

  def search
    @products = Product.where(genre_id: params[:id]).where(sale_status: true).page(params[:page]).per(8)

    # ↑ params[:id]にgenre.idが渡ってくる(_genres_sideber.html.erbの記述参照)
    # where(genre_id: params[:id])で渡ってきたgenre.idの商品だけを取得する
    # ただし、販売ステータスが有効のものだけを表示する必要があるので、where(sale_status: true)も同時に指定する
    # where(genre_id: params[:id]).where(sale_status: true)と繋げることによって、AかつBの商品を取得する（メソッドチェイン）
    # 要するに、渡ってきたジャンルidの商品で販売中の商品のみを取得して、@productsに入れてあげている

    @genre = Genre.find(params[:id]) # searchアクションが実行された場合の"「ジャンル名」一覧"表示用
    @genres = Genre.where(status: true) # サイドバーにジャンル名を取得して表示するため
    render :index
  end

end
