class DecksController < ApplicationController
  def index
    if logged_in?
      @decks=current_user.decks
    else
      redirect_to root
    end
  end
end
