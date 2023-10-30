class Parent::HomesController < ApplicationController

  def index
    @attendance = Attendance.new
  end

end