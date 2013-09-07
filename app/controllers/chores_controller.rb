class ChoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chores = current_house.chores.load
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = current_house.chores.new
  end

  def create
    @chore = current_house.chores.new(chore_params)
    if @chore.save
      redirect_to chores_path
    else
      render "chores/new"
    end
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :frequency, :last_completed)
  end
end
