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
    if params[:comment][:user_id].blank?
      params[:comment].delete(:user_id)
    end
    @comment = Comment.create(comment_params)
    redirect_to @comment.deck
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :deck_id, :user_id)
  end 
end
