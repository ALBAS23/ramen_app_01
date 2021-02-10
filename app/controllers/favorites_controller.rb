class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: params[:user_id], post_id: params[:post_id])
    favorite.save

    favorite = Favorite.where(user_id: params[:user_id], post_id: params[:post_id])
    favorite_count = Favorite.where(post_id: params[:post_id])

    render json: { favorite: favorite, favorite_count: favorite_count }
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    favorite_count = Favorite.where(post_id: params[:post_id]);

    render json: { favorite_count: favorite_count }
  end
end
