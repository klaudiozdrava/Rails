class RoomsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
    @current_user = current_user
    redirect_to home_path unless @current_user

    @room=Room.new
    @rooms = Room.public_rooms
    unless @current_user.nil?
      @users = @current_user.friends
    end
    @posts=Post.search(params[:search])


  end

  def create
  @room = Room.create(name: params["room"]["name"])
  end

  def make
  end

  def show
      @current_user = current_user
      @posts = Post.all.order("created_at DESC")
      @posts=Post.search(params[:search])
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = @current_user.friends
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
  end
end
