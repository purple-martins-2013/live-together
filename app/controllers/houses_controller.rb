class HousesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_user_has_house

  def show
    p current_user
  end

  def new
    @house = House.new
  end

  def create
    @house = House.create(params[:house])
    current_user.house = @house
    current_user.save
    redirect_to house_path(@house)
  end

  private

  def ensure_user_has_house
    redirect_to new_house_path if current_user.house.nil?
  end
end