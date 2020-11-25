class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    redirect_to anime_path(@review.anime_id)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to anime_path(params[:anime_id])
  end

  private
  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, anime_id: params[:anime_id])
  end
end
