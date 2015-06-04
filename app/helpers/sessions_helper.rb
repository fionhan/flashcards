module SessionsHelper
  def log_in(user)
    session[:user_id]=user.id
  end

  def current_user
    user_id=session[:user_id]
    if user_id
      user=User.find(user_id)
      if @current_user.nil?
        if user.type=="Teacher"
          @current_user=Teacher.find(user_id)
        elsif user.type=="Student"
          @current_user=Student.find(user_id)
        end
      end
      @current_user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user=nil
  end
end
