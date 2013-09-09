class ChoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @chores = current_house.chores.load.order("due_date ASC")
    respond_to do |format|
      format.html
      format.json { render json: @chores }
    end
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = current_house.chores.new
  end

  def create
    @chore = current_house.chores.create(chore_params)
    respond_to do |format|
      format.json { render json: @chore }
    end
  end

  def update
    @chore = Chore.find(params[:id])
    @chore.complete!(current_user) if params[:chore][:last_completed]
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @chore }
    end
  end

  private

  def chore_params
    params.require(:chore).permit(:title, :frequency, :last_completed, :points)
  end
end
