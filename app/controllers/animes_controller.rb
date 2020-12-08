class AnimesController < ApplicationController
  before_action :if_not_admin, only: [:new, :create]

  def index
    @top_like_animes = Anime.find(Like.group(:anime_id).order('count(anime_id) desc').limit(10).pluck(:anime_id))
  end

  def show
    @anime = Anime.find(params[:id])
    @reviews = @anime.reviews
    @review = Review.new
    @comment = Comment.new
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @animes = SearchAnimesService.search(params[:keyword])
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def anime_params
    params.require(:anime).permit(:name, :furigana, :summary, :image)
  end
end
