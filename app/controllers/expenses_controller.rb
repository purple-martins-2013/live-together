class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @house_expenses = Expense.where(purchaser_id: current_house.users)
    @user_debts = Debt.where( borrower: current_user)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = current_user.expenses.new
    @contributors = current_house.users.reject {|user| user == current_user }
  end

  def create
    expense_params[:total_cents] = to_cents(expense_params[:total])
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      redirect_to new_expense_path
    end
  end

  def new_from_grocery_list
    @grocery_list = GroceryList.find(params[:id])

    name = @grocery_list.name
    description = @grocery_list.grocery_items.map{|item| item.name }.join(', ')
    contributors = @grocery_list.users.map{|user| user.id }

    @expense = current_user.expenses.new(
      name: name,
      description: description,
      contributor_ids: contributors
      )
  end

  def destroy
    Expense.find_by_id(params[:id]).destroy
    redirect_to expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :total, :description, :purchased_on, :contributor_ids,  {:contributor_ids => []})
  end
end
