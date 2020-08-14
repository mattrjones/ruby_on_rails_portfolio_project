class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :create_from_omniauth]

  def index
  end

  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
    session[:user_id] = @user.id
    redirect_to '/welcome'
    else 
      render 'login'
    end 
  end

  private

def user_params
  params.require(:user).permit(:email, :password)
 end 

end 


