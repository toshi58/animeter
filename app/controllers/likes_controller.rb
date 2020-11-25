class LikesController < ApplicationController
  before_action :set_anime

  def create
    Like.create(anime_id: params[:id], user_id: current_user.id)
  end

  def destroy
    @like = Like.find_by(anime_id: params[:id], user_id: current_user.id)
    @like.destroy
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
