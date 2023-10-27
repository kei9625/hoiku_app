class Employee::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_employee, only: [:edit, :update, :destroy]

  def index
    @notes = current_employee.notes
  end

  def show
  end

  def new
    @note = Note.new
    @parents = Parent.all  # 保護者の情報を全て取得
  end


  def create
    @note = Note.new(note_params)
    @note.employee = current_employee

    if @note.save
      redirect_to employee_note_path(@note), notice: '連絡帳を作成しました'
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
      redirect_to employee_note_path(@note), notice: '連絡帳を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to employee_notes_path, notice: '連絡帳を削除しました'
  end

  private

  # 編集や更新、削除を試みるEmployeeが、実際にその連絡帳を作成したEmployeeであるかを確認
  def ensure_correct_employee
    unless @note.employee == current_employee
      redirect_to employee_notes_path, alert: 'アクセス権限がありません。'
    end
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :parent_id)
  end
end
