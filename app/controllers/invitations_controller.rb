class InvitationsController < ApplicationController

  def create
    @invitation = current_house.invitations.create(invitation_params)
    redirect_to :back
  end

  def accept
    invitation = Invitation.find(params[:id])
    current_user.house = invitation.house
    current_user.save
    redirect_to house_path(invitation.house)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

end