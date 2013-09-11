class SettlementsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @settlements = Settlement.where(:contributor == current_house.users).where.not(contributor: current_user )
    @debts = []
    current_house.users.each do |user|
      next if user == current_user
      total = Settlement.where(:contributor == user).sum(:amount_cents)
      @debts << [user, total]
    end
  end

  def show
    @settlement = Settlement.find(params[:id])
  end

  def update
    @settlement = Settlement.find(params[:id])
    @settlement.pay! if params[:settlement][:date_paid]
    redirect_to :back
  end

  private

  def settlement_params
    params.require(:settlement).permit(:expense, :amount_cents, :date_paid)
  end
end
