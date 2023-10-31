class Parent::MypagesController < ApplicationController
before_action :authenticate_parent!

  def show
    @parent = current_parent
    @kids = @parent.kids
  end

  def edit
    @parent = current_parent
  end

  def update
    @parent = current_parent
    if @parent.update(parent_params)
      flash[:notice] = "情報を更新しました。"
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def parent_params
    params.require(:parent).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number)
  end

end
