class CompletedChoresController < ApplicationController
  def index
    @completed_chores = CompletedChore.all
  end
end