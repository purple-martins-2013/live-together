class InvitationsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @invitation = current_user.invitations.create(invitation_params)

    respond_to do |format|
      if @invitation
        UserMailer.invitation_email(@invitation).deliver
        flash[:notice] = "Invitation sent to #{invitation_params[:email]}"
        format.html { redirect_to :back }
      else
        flash[:notice] = "Invitation sent to #{invitation_params[:email]}"
        format.html
      end
      format.json { render json: @invitation }
    end
  end

  def accept
    @invitation = Invitation.find(params[:id])
    current_user.house = @invitation.user.house
    current_user.save
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

end