class DecksController < ApplicationController
  before_action :authenticate_user!

  def index
    @decks=current_decks
  end

  def new
    @deck=Deck.new
  end

  def create
    @deck=current_decks<<Deck.create(deck_params)
    redirect_to decks_path
  end

  def edit
    @deck=find_deck
  end

  def update
    @deck=find_deck
    @deck.update_attributes(deck_params)
    if @deck.valid?
      redirect_to decks_path
    else
      render :edit
    end
  end

  private
  def find_deck
    current_decks.find(params[:id])
  end

  def current_decks
    current_user.decks
  end

  def deck_params
    params.require(:deck).permit!
  end
end
