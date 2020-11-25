class WatchesController < ApplicationController
  before_action :set_anime

  def create
    Watch.create(anime_id: params[:id], user_id: current_user.id)
  end

  def destroy
    @watch = Watch.find_by(anime_id: params[:id], user_id: current_user.id)
    @watch.destroy
  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
end
