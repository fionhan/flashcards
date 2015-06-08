class DecksController < ApplicationController
  before_action :require_login
  def index
    @decks=current_user.decks
  end

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end
end
