class AnimesController < ApplicationController
  def index
    @top_like_animes = Anime.find(Like.group(:anime_id).order('count(anime_id) desc').limit(10).pluck(:anime_id))
  end

  def show
    @anime = Anime.find(params[:id])
    @reviews = @anime.reviews
    @review = Review.new
    @comment = Comment.new
  end

  def search
    @animes = SearchAnimesService.search(params[:keyword])
  end
end
