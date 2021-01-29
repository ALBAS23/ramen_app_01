class PostsController < ApplicationController
  before_action :move_to_top_pages, except: :top

  def index
    @posts_created_at = Post.order("created_at DESC")
    @posts_price = Post.order("price DESC")
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
    @post = Post.find(params[:id])
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private 

  def move_to_top_pages
    unless user_signed_in?
      redirect_to top_posts_path 
    end
  end

  def post_params
    params.require(:post).permit(:menu, :store, :price, :genre_id, :word, :prefecture_id, :place, :image).merge(user_id: current_user.id)
  end
end
