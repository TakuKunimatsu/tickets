class OrdersController < ApplicationController
  before_action :authenticate_user!,

  def index
    @performance = Performance.find(params[:performance_id])
    @schedule = Schedule.find(params[:schedule_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @performance = Performance.find(params[:performance_id])
    @schedule = Schedule.find(params[:schedule_id])
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:buy_count).merge(
      user_id: current_user.id, performance_id: params[:performance_id],schedule_id: params[:schedule_id])
  end




end
