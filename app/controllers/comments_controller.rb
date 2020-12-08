class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to anime_path(@comment.review.anime_id)
  end

  private

  def comment_params
    params.permit(:text, :review_id).merge(user_id: current_user.id)
  end
end
