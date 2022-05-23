class PerformancesController < ApplicationController
  before_action :authenticate_admin_user!, except: [:index, :show]

  def index
    @performances = Performance.all.order('created_at DESC')
  end

  def new
    @performance = Performance.new
  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.valid? 
      @performance.save
      redirect_to root_path    
    else
      render :new
    end
  end

  def show
    @performance = Performance.find(params[:id])
  end

  private

  def performance_params
    params.require(:performance).permit(:name, :theater, :start_day, :last_day, :info, :price, :image).merge(admin_user_id: current_admin_user.id)
  end

  
end
