class SettlementsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @settlements = current_user.settlements.load
    respond_to do |format|
      format.html
      format.json { render json: @settlements }
    end
  end

  def show
    @settlement = Settlement.find(params[:id])
  end

  def new
    @settlement = current_user.settlements.new
  end

  def create
    @settlement = current_user.settlements.create(settlement_params)
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @settlement }
    end
  end

  def update
    @settlement = Settlement.find(params[:id])
    @settlement.pay! if params[:settlement][:date_paid]
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @settlement }
    end
  end

  private

  def settlement_params
    params.require(:settlement).permit(:amount_cents, :date_paid)
  end
end
