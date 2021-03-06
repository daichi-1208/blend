class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_to theme_post_path(params[:theme_id],params[:post_id])
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    redirect_to theme_post_path(params[:theme_id],params[:post_id])
  end
end