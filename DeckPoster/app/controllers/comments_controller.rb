class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to @comment.deck
  end

  private 

  def comment_params
    params.permit(:content, :deck_id, :user_id)
  end 
end
