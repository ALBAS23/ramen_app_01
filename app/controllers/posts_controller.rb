class PostsController < ApplicationController
  before_action :move_to_top_pages, except: :top
  before_action :move_to_root_path_top, only: :top
  before_action :post_data, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]

  def index
    @posts_created_at = Post.order("created_at DESC").page(params[:page]).per(6)
    @posts_price = Post.order("price DESC").page(params[:page]).per(6)
  end

  def top

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @posts = Favorite.where(post_id: params[:id])
    @post_favorite = @post.favorites.where(user_id: current_user.id)
    @post_favorite = @post_favorite[0]
  end

  def edit 

  end

  def update 
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    if ! (params[:keyword_price].empty?)
      @search_results = Post.search_price(params[:keyword_price]) 
    elsif ! (params[:keyword_genre].empty?)
      @search_results = Post.search_genre(params[:keyword_genre])
    elsif ! (params[:keyword_prefecture].empty?)
      @search_results = Post.search_prefecture(params[:keyword_prefecture])
    elsif ! (params[:keyword_store].empty?)
      @search_results = Post.search_store(params[:keyword_store])
    end
    render :search 
  end

  private 

  def move_to_top_pages
    unless user_signed_in?
      redirect_to top_posts_path 
    end
  end

  def move_to_root_path_top
    if user_signed_in?
      redirect_to root_path
    end
  end

  def post_data
    @post = Post.find(params[:id])
  end

  def move_to_root_path
    unless @post.user.id == current_user.id
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:menu, :store, :price, :genre_id, :word, :prefecture_id, :place, :image).merge(user_id: current_user.id)
  end
end
