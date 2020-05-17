class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create 
    @deck = Deck.new(deck_params)
    #@deck.user_id = current_user.id
    redirect_to @deck
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
    params.require(:deck).permit(:name, :decklist, :description, :user_id)
  end 

end
