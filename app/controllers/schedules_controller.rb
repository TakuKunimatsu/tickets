class SchedulesController < ApplicationController
  before_action :authenticate_admin_user!
  
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    redirect_to request.referer
  end

  def edit
    @performance = Performance.find(params[:id])
    @schedule = Schedule.find(params[:id])
    redirect_to root_path if @performance.admin_user_id != current_admin_user.id
  end

  def update
    Schedule.transaction do
      schedule = Schedule.lock.find(params[:id])
      schedule.update(schedule_params)
      redirect_to performance_path
    end
  end

  private

  def schedule_params
    params
      .require(:schedule)
      .permit(:performance_day, :performance_time, :stock).merge(performance_id: params[:performance_id])
  end
end
