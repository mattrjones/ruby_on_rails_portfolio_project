class DecksController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found"
      else 
        @decks = @user.decks 
      end 
    else
      @decks = Deck.all 
    end 
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create 
    @deck = Deck.new(deck_params)
    if @deck.save 
    redirect_to @deck
    else 
      render :new 
    end 
  end 

  def edit 
    @deck = Deck.find(params[:id])
  end

  def update 
    @deck = Deck.find(params[:id])
    @deck.update(deck_params)
 
    redirect_to deck_path(@deck)
  end

  private 

  def deck_params
    params.require(:deck).permit(:name, :decklist, :description, :user_id, :archetype_id)
  end 

end
