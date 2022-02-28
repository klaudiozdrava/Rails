class HomeController<ApplicationController



  def index
      @user=User.new

  end

  def create

    #@user=User.find_by(username: params[:username])
    user=User.find_by(username: params[:username])
    if !!user && user.authenticate(params[:password])
      # session[:user_id]=@user.id
      # redirect_to main_path
      log_in(user)
    else
      # flash[:error] = "error"
      render :index
    end
  end

  def destroy

    session[:user_id]=nil
    redirect_to home_path,notice:"Logged out"
  end


end
