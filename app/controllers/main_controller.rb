class MainController<ApplicationController





  # def index
  #   # @posts = Post.all.order("created_at DESC")
  #    @current_user = current_user
  #    redirect_to home_path unless @current_user
  #    @room=Room.new
  #    @rooms = Room.public_rooms
  #    @users = @current_user.friends
  #    @posts=Post.search(params[:search])
  #   # if session[:user_id]
  #   #   @posts=Post.search(params[:search])
  #   #   @user=User.find_by(id: session[:user_id])
  #   #
  #   # else
  #   #   redirect_to home_path
  #   # end
  # end
  #
  # def create
  #   @room = Room.create(name: params["room"]["name"])
  #
  # end




# def search
#
#   @query=params[:query]
#   @posts=Post.where("posts.title Like ?",["%#{@query}%"])
#   render :index
#
#
# end



end
