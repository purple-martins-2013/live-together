class CompletedChoresController < ApplicationController
  def index
    @completed_chores = CompletedChore.all.order("completed_at DESC")
  end
end