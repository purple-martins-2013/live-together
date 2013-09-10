class CompletedChoresController < ApplicationController
  def index
    @completed_chores = current_house.completed_chores.order("completed_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @completed_chores }
    end
  end
end