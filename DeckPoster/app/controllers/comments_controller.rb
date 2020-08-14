class CommentsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else 
        @comments = @user.comments 
      end 
    else
      @comments = Comment.all 
    end 
  end

  def new
    @comment = Comment.new 
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      @comment.deck.comments_count += 1
      @comment.deck.save 
    redirect_to @comment.deck
    else 
      render :new 
    end 
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :deck_id, :user_id)
  end 
end
