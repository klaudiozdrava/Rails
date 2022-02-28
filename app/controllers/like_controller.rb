class LikeController<ApplicationController

  def new
    @like=Like.new
  end

  def create
    @liked_post=params[:post_id]
    @current_user=params[:user_id]


    alreadyexist=Like.where(post_id:@liked_post,user_id:@current_user)
    if alreadyexist.count==1
      alreadyexist=Like.find(alreadyexist.ids[0])
      alreadyexist.destroy
      redirect_to root_path

    else
      @like=Like.new(post_id:@liked_post,user_id:@current_user)
      @like.save
      redirect_to root_path
    end
    # if @like.save
    #     redirect_to main_path,notice:"succesfully"
    #
    # end

  end

  # def find
  #   @who_liked=params[:]
  #
  # end

  # private
  #
  # def likes_params
  #
  #   params.require(:like).permit(:post_id)
  # end

end
