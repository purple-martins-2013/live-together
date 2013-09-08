class GroceryItemsController < ApplicationController
  before_filter :authenticate_user!


  def new
    @grocery_item = GroceryItem.new
    @grocery_list = GroceryList.find(params[:grocery_list_id])
  end

  def create
    @grocery_list = GroceryList.find(params[:grocery_list_id])
    @grocery_item = @grocery_list.grocery_items.new(grocery_item_params)

    if @grocery_item.save
      redirect_to grocery_list_path(@grocery_list)
    else
      redirect_to new_grocery_list_grocery_item_path
    end
  end

  def destroy
    GroceryItem.find_by_id(params[:id]).destroy
    redirect_to grocery_lists_path
  end

  private

    def grocery_item_params
      params.require(:grocery_item).permit(:name)
    end

end
