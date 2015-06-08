class UserService
  def initialize(params)
    if params[:type]
      @type=params[:type]
      params.delete(:type)
      @user_params=params
    end
  end

  def create_user
    if @type
      if @type=="Teacher"
        @user=Teacher.new(@user_params)
      elsif @type=="Student"
        @user=Student.new(@user_params)
      end
    end
  end
end