class WantsController < ApplicationController
  before_action :set_anime

  def create
    Want.create(anime_id: params[:id], user_id: current_user.id)
  end

  def destroy
    @want = Want.find_by(anime_id: params[:id], user_id: current_user.id)
    @want.destroy
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
