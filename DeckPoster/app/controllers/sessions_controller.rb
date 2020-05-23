class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new 
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/welcome'
    else 
       redirect_to '/login'
    end

    private
 
    def auth
      request.env['omniauth.auth']
    end
    
 end
 

  def login
  end

  def welcome
    @user = current_user
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    render 'welcome'

  end 
end
