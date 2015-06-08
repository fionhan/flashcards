class CardsController < ApplicationController
  before_action :find_deck,only:[:index,:create]
  before_action :find_card,only:[:show,:edit,:destroy,:update]
  def index
    @cards=find_cards
  end

  def new
    @card=Card.new
  end

  def create
    @deck.cards<<Card.create(front: params[:card][:front], back: params[:card][:end])
    redirect_to deck_cards_path(params[:deck_id])
  end

  def show
  end

  def edit
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(params[:deck_id])
  end

  def update
    @card.update_attributes(card_params)
    if @card.valid?
      redirect_to deck_cards_path(params[:deck_id])
    else
      render :edit
    end
  end

  private
  def find_cards
    find_deck.cards
  end

  def find_card
    @card=find_cards.find(params[:id])
  end

  def find_deck
    @deck=Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit!
  end
end
