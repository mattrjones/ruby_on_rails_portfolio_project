class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
  end

  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :email,        
    :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

end 


