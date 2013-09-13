class UsersController < ApplicationController
  def index
    @users = current_house.users
    render json: @users
  end

  def get_current_user
    render json: current_user
  end
end