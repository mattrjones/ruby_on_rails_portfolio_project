class DecksController < ApplicationController

  before_action :set_user, only: [:index]
  before_action :set_deck, only: [:edit, :update]
  def index
    if params[:user_id]
      @user = User.find_by(params[:id])
      if @user.nil?
      redirect_to users_path, alert: "User not found"

      else 
        @decks = @user.decks 
      end 
    else 
      @q = Deck.ransack(params[:q])
   @decks = @q.result(distinct: true)
    end 
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @deck = @user.decks.find_by(id: params[:id])
      if @deck.nil?
        redirect_to user_decks_path(@user), alert: "Deck not found"
      end
    else
      @user = User.find_by(id: session[:user_id])
      @deck = Deck.find(params[:id])
    end
  end

  def new
    @deck = Deck.new
  end

  def create 
    @deck = Deck.create(deck_params)
    if @deck.save 
    redirect_to @deck
    else 
      render :new 
    end 
  end 

  def edit 
    @deck = Deck.find_by(params[:id])
  end

  def update 
    @deck = Deck
    @deck.update(deck_params)
 
    redirect_to deck_path(@deck)
  end

  def commented
  end

  private 

  def deck_params
    params.require(:deck).permit(:name, :archetype_name, :description, :decklist, :user_id)
  end 

  def set_user
    @user = User.find_by(params[:id])
  end 

  def set_deck 
    @deck = Deck.find_by(params[:id])
  end 

end
