class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    @user = User.new 
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
 
    session[:user_id] = @user.id
 
    redirect_to 'welcome'
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
