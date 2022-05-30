class PerformancesController < ApplicationController
  before_action :authenticate_admin_user!, except: [:index, :show, :search]

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

  def edit
    @performance = Performance.find(params[:id])
    redirect_to action: :index if @performance.admin_user_id != current_admin_user.id
  end

  def update
    performance = Performance.find(params[:id])
    if performance.update(performance_params)
      redirect_to performance_path
    else
      render :edit
    end
  end

  def show
    @performance = Performance.find(params[:id])
    @schedule = Schedule.new
    @schedules = @performance.schedules
  end

  def destroy
    performance = Performance.find(params[:id])
    if performance.admin_user_id == current_admin_user.id
      performance.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def search
    @performances = Performance.search(params[:keyword])
  end

  private

  def performance_params
    params.require(:performance).permit(:name, :theater, :start_day, :last_day, :info, :price, :image).merge(admin_user_id: current_admin_user.id)
  end

  
end
