class PerformancesController < ApplicationController
  
  #def index
  #end

  def new
    @performance= Performance.new
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


  private

  def performance_params
    params.require(:performance).permit(:name, :theater, :start_day, :last_day, :info, :price, :image).merge(admin_user_id: current_admin_user.id)
  end

  
end
