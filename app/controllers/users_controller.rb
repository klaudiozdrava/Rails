class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all.order("created_at DESC")
    @current_user = current_user
    @rooms = Room.public_rooms
    @users = @current_user.friends
    @room = Room.new
    @posts=Post.search(params[:search])
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages

    render "rooms/index"
  end

  private
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
