class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :createlocal]

  def new
    @user = User.new 
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    render 'welcome'
  end

  def createlocal
    @user = User.find_by(:email => params[:email])
    if @user.password == params[:password]
    session[:user_id] = @user.id 
    render 'welcome'
    else 
      session.delete(:user_id)
      @current_user = nil
      render 'welcome'
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

  private
 
  def auth
    request.env['omniauth.auth']
  end
end
