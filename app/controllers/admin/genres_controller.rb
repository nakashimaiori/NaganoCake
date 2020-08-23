class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre =Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを更新しました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを作成しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :status)
  end
end
