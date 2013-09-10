class CompletedChoresController < ApplicationController
  def index
    @completed_chores = current_house.completed_chores.order("completed_at DESC")
  end
end