class Parent::KidsController < ApplicationController
  before_action :set_parent

  def new
    @kid = @parent.kids.new
  end

  def create
    @kid = @parent.kids.new(kid_params)
    if @kid.save
      redirect_to mypage_path(@parent, @kid), notice: 'お子様の情報が正常に登録されました。'
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
      redirect_to mypage_path(@parent, @kid), notice: 'お子様の情報が正常に更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @kid = @parent.kids.find(params[:id])
    @kid.destroy
    redirect_to parent_kids_path(@parent), notice: 'お子様の情報が正常に削除されました。'
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def kid_params
    params.require(:kid).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :gender, :allergy_info)
  end
end