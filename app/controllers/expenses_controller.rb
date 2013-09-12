class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @house_expenses =Expense.where(purchaser_id: current_house.users)
    # @expenses = current_user.expenses.load
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
    @expense = current_user.expenses.new(expense_params)
    if @expense.save
      redirect_to expenses_path
    else
      redirect_to new_expense_path
    end
    # respond_to do |format|
    #   format.html { redirect_to :back }
    #   format.json { render json: @expense }
    # end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :total_cents, :description, :purchased_on, {:contributor_ids => []})
  end
end
