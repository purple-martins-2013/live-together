class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @paymntes = Payment.where(:borrower == current_house.users)
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def update
  end


  def destroy
  end

  private

  def payment_params
    params.require(:payment).permit(:lender, :borrower, :amount_cents, :description)
  end
end
