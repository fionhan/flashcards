class UsersController<ApplicationController
  def new
    @user=User.new
  end

  def create
    if user_params[:type]
      if user_params[:type]=="Teacher"
        @user=Teacher.new(user_params)
      elsif user_params[:type]=="Student"
        @user=Student.new(user_params)
      end
      if (@user.save)
        log_in @user
        flash[:success] = "welcome to flashcards app #{@user.name}"
        redirect_to decks_path
      else
        render :new
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end
end
