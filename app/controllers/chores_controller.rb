class ChoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chores = current_house.chores.load.order("due_date ASC")
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

  def update
    @chore = Chore.find(params[:id])
    if params[:chore][:last_completed]
      @chore.complete!(current_user)
    end
    redirect_to :back
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :frequency, :last_completed, :points)
  end
end
