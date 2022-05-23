class SchedulesController < ApplicationController

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    redirect_to "/performances/#{@schedule.performance.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private

  def schedule_params
    params
      .require(:schedule)
      .permit(:performance_day, :performance_time, :stock).merge(performance_id: params[:performance_id])
  end
end
