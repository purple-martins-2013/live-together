class GroceryListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_grocery_list, only: [:show, :edit, :update, :destroy]

  def index
    @grocery_lists = current_user.house.grocery_lists
  end

  def show
  end

  def new
    @grocery_list = GroceryList.new
  end

  def create
    @grocery_list = current_house.grocery_lists.find_or_create_by_name(name: grocery_list_params[:name])
    @grocery_list.update(grocery_list_params)
    if @grocery_list.valid?
      redirect_to grocery_list_path @grocery_list
    else
      render "grocery_lists/new"
    end
  end

  def edit
  end

  def update
    if @grocery_list.update(grocery_list_params)
      redirect_to grocery_list_path @grocery_list
    else
      render action: 'edit'
    end
  end

  def destroy
    @grocery_list.destroy
    redirect_to grocery_lists_path
  end

  def set_grocery_list
    @grocery_list = GroceryList.find(params[:id])
  end

  def grocery_list_params
    params.require(:grocery_list).permit(:name)
  end
end
