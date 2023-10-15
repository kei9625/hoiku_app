class Employee::MypagesController < ApplicationController
  before_action :authenticate_employee!

  def show
    @employee = current_employee
  end

  def edit
    
  end

  # 他のアクションもここに追加
end
