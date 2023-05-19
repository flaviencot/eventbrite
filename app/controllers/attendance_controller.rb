class AttendanceController < ApplicationController
  
  before_action :authenticate_user!
  def index
    @all_attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = Attendance.new
    @event = Event.find(params[:event_id].to_i)
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
