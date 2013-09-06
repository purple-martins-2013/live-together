class HousesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_has_house, only: [:show]

  def show
    @house = current_house
    @invitation = Invitation.new
  end

  def new
    @house = House.new
    @invitations = Invitation.where(email: current_user.email)
  end

  def create
    @house = House.new(house_params)
    if @house.save
      current_user.house = @house
      current_user.save
      redirect_to house_path @house
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