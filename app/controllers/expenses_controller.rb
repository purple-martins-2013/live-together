class ExpensesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @expenses = current_user.expenses.load
    respond_to do |format|
      format.html
      format.json { render json: @expenses }
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = current_user.expenses.new
  end

  def create
    @expense = current_user.expenses.create(expense_params)
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @expense }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :total_cents, :description, :purchased_on)
  end
end
