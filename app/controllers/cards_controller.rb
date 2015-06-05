class CardsController < ApplicationController
  def index
    @cards=find_cards
    @deck=find_deck
  end

  def new
    @card=Card.new
  end

  def create
    @deck=find_deck
    @deck.cards<<Card.create(front: params[:card][:front], back: params[:card][:end])
    redirect_to deck_cards_path(params[:deck_id])
  end

  def show
    @card=find_card
  end

  def edit
    @card=find_card
  end

  def destroy
    @card=find_card
    @card.destroy
    redirect_to deck_cards_path(params[:deck_id])
  end

  def update
    @card=find_card
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
    find_cards.find(params[:id])
  end

  def find_deck
    Deck.find(params[:deck_id])
  end

  def card_params
    params.require(:card).permit!
  end
end
