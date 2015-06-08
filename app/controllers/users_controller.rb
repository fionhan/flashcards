class UsersController<ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=create_with_user_service
    if @user && @user.save
      log_in @user
      flash[:success] = "welcome to flashcards app #{@user.name}"
      redirect_to decks_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end

  def create_with_user_service
    UserService.new(user_params).create_user#use a service to handle the logical rules
  end
end
