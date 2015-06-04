class DecksController < ApplicationController
  before_action :authenticate_user!
  def index
    @decks=current_user.decks
  end
end
