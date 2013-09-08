class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @invitation = current_house.invitations.create(invitation_params)
    UserMailer.invitation_email(@invitation).deliver
    flash[:notice] = "Invitation sent to #{invitation_params[:email]}"
    redirect_to :back
  end

  def accept
    @invitation = Invitation.find(params[:id])
    current_user.house = @invitation.house
    current_user.save
    redirect_to house_path(@invitation.house_id)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

end