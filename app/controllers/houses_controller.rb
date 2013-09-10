class HousesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_has_house, only: [:show]

  def show
    @house = current_house
    @invitation = Invitation.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house}
    end
  end

  def new
    @house = House.new
    @invitations = Invitation.where(email: current_user.email)
  end

  def create
    @house = House.create(house_params)
    if @house.persisted?
      current_user.update_attributes(house:@house)
      redirect_to root_path
    else
      render "houses/new"
    end
  end

  private

  def house_params
    params.require(:house).permit(:name, :address)
  end

  def ensure_user_has_house
    redirect_to new_house_path if current_user.house.nil?
  end
end
