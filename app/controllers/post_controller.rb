class PostController < ApplicationController





    def index
      @post=Post.new
    end



     def create

        @post = Post.new(post_params)
        @post.user_id=session[:user_id]
        if @post.save
          flash[:success] = "Micropost created!"
          redirect_to root_path,notice:"succesfully"
        else

          render :index

        end
     end


     private

     def post_params

       params.require(:post).permit(:title,:content,:image)
     end



end
