class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @animes = Anime.all
    @liked_animes = @user.liked_animes
    @watched_animes = @user.watched_animes
    @wanted_animes = @user.wanted_animes
  end
end
