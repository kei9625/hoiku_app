class Parent::KidsController < ApplicationController
  before_action :set_parent
  before_action :set_kid, only: [:show, :edit, :update, :destroy]

  def new
    @kid = @parent.kids.new
  end

  def create
    @kid = @parent.kids.new(kid_params)
    if @kid.save
      redirect_to parent_kid_path(@parent, @kid), notice: 'お子様の情報が正常に登録されました。'
    else
      render :new
    end
  end

  def edit
    # before_actionで@kidを設定
  end

  def update
    if @kid.update(kid_params)
      redirect_to parent_kid_path(@parent, @kid), notice: 'お子様の情報が正常に更新されました。'
    else
      render :edit
    end
  end

  def show
    # before_actionで@kidを設定
  end

  def destroy
    @kid.destroy
    redirect_to parent_kids_url(@parent), notice: 'お子様の情報が正常に削除されました。'
  end

  private

  def set_kid
    @kid = @parent.kids.find(params[:id])
  end

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def kid_params
    params.require(:kid).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, :gender, :allergy_info)
  end
end