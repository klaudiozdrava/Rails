class RegisterController<ApplicationController



  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      # session[:user_id]=@user.id
      # redirect_to root_path,notice:"succesfully"
      redirect_to home_path 
    else
      render :new
    end


  end

  def show
    @user=User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:username,:email,:studies ,:password,:password_confirmation,:avatar)
  end
end
