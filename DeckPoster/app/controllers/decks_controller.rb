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
    @deck = Deck.find(params[:id])
  end

  def update 
    @deck = Deck.find(params[:id])
    @deck.update(deck_params)
 
    redirect_to deck_path(@deck)
  end

  def commented
  end

  private 

  def deck_params
    params.require(:deck).permit(:name, :archetype_name, :description, :decklist, :user_id)
  end 

end
