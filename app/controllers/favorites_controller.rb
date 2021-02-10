class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: params[:user_id], post_id: params[:post_id])
    favorite.save

    favorite = Favorite.where(user_id: params[:user_id], post_id: params[:post_id])

    render json: { favorite: favorite }
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    favorite = nil;

    render json: { favorite: favorite }
  end
end
