class SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.valid? 
      @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def schedule_params
    params
      .require(:schedule)
      .permit(:performance_day, :performance_time, :stock).merge(performance_id: params[:performance_id])
  end
end
