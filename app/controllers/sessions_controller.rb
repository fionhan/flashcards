class SessionsController < ApplicationController
  def new
  end
  def create
    user=User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to decks_path
    else
      flash[:fail] = "username or password is incorrect"
      redirect_to login_path
    end
  end
  def index

  end
  def destroy
    log_out
    redirect_to login_path
  end

end
