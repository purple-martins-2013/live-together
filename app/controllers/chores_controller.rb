class ChoresController < ApplicationController

  def index
    @chores = Chore.all
  end

  def new
    @chore = Chore.new
  end

  def create
    
  end
end
