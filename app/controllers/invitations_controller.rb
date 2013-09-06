class InvitationsController < ApplicationController

  def create
    @invitation = current_house.invitations.create(invitation_params)
    redirect_to :back
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

end