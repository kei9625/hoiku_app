class Employee::MypagesController < ApplicationController
  before_action :authenticate_employee!

  def show
    @employee = current_employee
  end

  def edit
    @employee = current_employee
  end

  def update
    @employee = current_employee
    if @employee.update(employee_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to employee_mypage_path
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted)
  end
end