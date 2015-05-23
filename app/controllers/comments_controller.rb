class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    build_comment
    save_comment or render 'new'
  end

  private

  def build_comment
    @comment ||= Comment.new
    @comment.tour_id = params[:tour_id]
    @comment.user_id = current_user.id
    @comment.content = comment_params[:content]
  end

  def save_comment
    redirect_to Tour.find(params[:tour_id]) if @comment.save
  end

  def comment_params
    comment_params = params[:comment]
    comment_params ? comment_params.permit(:content) : {}
  end
end