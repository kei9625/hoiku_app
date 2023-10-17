class Employee::ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update]

  def index
    @parents = Parent.all
  end

  def show
  end

  def edit
  end

  def update
    if @parent.update(parent_params)
      redirect_to employee_parent_path(@parent), notice: '情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number)
  end
end