class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new 
  end

  def create 
    @user = User.find_by(:email => params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render 'welcome'
    else
      redirect_to "/login"
    end
  end

  def createfb
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
   
      session[:user_id] = @user.id
   
      render 'welcome'
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

  private
 
  def auth
    request.env['omniauth.auth']
  end
end
