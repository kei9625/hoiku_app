class Employee::NotesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_employee, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_employee.notes
    @parents = Parent.all
  end

  def show_parent_notes
    @parent = Parent.find(params[:parent_id]) # IDの取得の仕方を修正
    @notes = @parent.notes
  end

  def show
  end

  # 新しい連絡帳を作成するためのアクション
  def new
    @note = Note.new
    @parents = Parent.all  # 保護者の情報を全て取得
  end

  # 連絡帳をデータベースに保存するためのアクション
  def create
    @note = current_employee.notes.build(note_params)

    if @note.save
      flash[:notice] = "連絡帳を作成しました。"
      redirect_to employee_note_path(@note)
    else
      @parents = Parent.all  # 保存に失敗した場合、再度保護者の情報を取得
      render :new
    end
  end

  def edit
    @parents = Parent.all
  end

  def update
    if @note.update(note_params)
      flash[:notice] = "連絡帳を更新しました。"
      redirect_to employee_note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = "連絡帳を削除しました。"
    redirect_to employee_notes_path
  end

  private

  # 編集や更新、削除を試みるEmployeeが、実際にその連絡帳を作成したEmployeeであるかを確認
  def ensure_correct_employee
    unless @note.employee == current_employee
      redirect_to employee_notes_path, alert: 'アクセス権限がありません。'
    end
  end

  def set_note
    @note = current_employee.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :parent_id)
  end
end
