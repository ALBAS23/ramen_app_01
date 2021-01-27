class PostsController < ApplicationController
  before_action :move_to_top_pages, except: :top

  def index

  end

  def top
    @posts = Post.new
  end

  def new

  end

  private 

  def move_to_top_pages
    unless user_signed_in?
      redirect_to top_posts_path 
    end
  end
end
