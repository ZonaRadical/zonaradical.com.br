class CommentsController < ApplicationController
  def create
    build_comment
    save_comment or render 'new'
  end

  private

  def build_comment
    @comment ||= Comment.new
    @comment.content = comment_params[:content]
  end

  def save_comment
    tour = Tour.find(params[:tour_id])
    redirect_to tour if @comment.save(tour, current_user)
  end

  def comment_params
    comment_params = params[:comment]
    comment_params ? comment_params.permit(:content) : {}
  end
end