class UsersController < ApplicationController
  def index
    @users = current_house.users
    render json: @users
  end
end