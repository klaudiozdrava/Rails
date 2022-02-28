class InvitationsController < ApplicationController
  def create
    id1 = params[:id1]
    id2 = params[:id2]
    @invitation = Invitation.new(user_id: id1, friend_id: id2)
    @invitation.save
    redirect_to root_path
  end

  def destroy
    invitation = Invitation.find(params[:invitation_id])
    invitation.destroy
    redirect_to root_path
  end

  def update
    invitation = Invitation.find(params[:invitation_id])

    invitation.update(confirmed: true)
    redirect_to root_path
  end
end
