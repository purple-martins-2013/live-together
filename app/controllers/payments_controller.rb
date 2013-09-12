class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @payments = Payment.where("lender_id = ? or borrower_id = ?", current_user.id, current_user.id )
    @settlements = current_user.settlements
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    lender = User.find(params[:lender_id])
    amount = current_user.debt_with(lender).abs
    payment_params = { lender: lender , amount_cents: amount }
    @payment = current_user.payments.new(payment_params)
  end

  def create
    payment_params[:amount_cents] = to_cents(payment_params[:amount])
    @payment = current_user.payments.create(payment_params)
    if @payment.persisted?
      flash[:notice] = "Payment registered succesfully."
      redirect_to payments_path
    else
      p @payment.errors.full_messages
      flash[:error] = "Error while creating payment."
      render new_payment_path
    end
  end

  def destroy
    Payment.find_by_id(params[:id]).destroy
    redirect_to payments_path
  end

  def payment_request
    lender = current_user
    borrower = User.find(params[:borrower_id])
    UserMailer.payment_request_email(lender, borrower).deliver
    flash[:notice] = "Payment request sent."
    redirect_to payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :date, :description, :method, :lender_id)
  end
end
