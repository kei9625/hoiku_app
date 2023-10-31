class Parent::KidsController < ApplicationController
  before_action :set_parent

  def new
    @kid = @parent.kids.new
  end

  def create
    @kid = @parent.kids.new(kid_params)
    if @kid.save
      flash[:notice] = "お子様の情報が正常に登録されました"
      redirect_to mypage_path(@parent, @kid)
    else
      render :new
    end
  end

  def edit
    @kid = @parent.kids.find(params[:id])
  end

  def update
    @kid = @parent.kids.find(params[:id])
    if @kid.update(kid_params)
      flash[:notice] = "お子様の情報が正常に更新されました"
      redirect_to mypage_path(@parent, @kid)
    else
      render :edit
    end
  end

  def destroy
    @kid = @parent.kids.find(params[:id])
    @kid.destroy
    flash[:notice] = "お子様の情報が正常に削除されました。"
    redirect_to parent_kids_path(@parent)
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def kid_params
    params.require(:kid).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :gender, :allergy_info)
  end
end