class Parent::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_parent, only: [:show, :edit, :update, :destroy]
  def index
    @notes = current_parent.notes
  end

  def show
  end

  def new
    @note = current_parent.notes.build
    @employees = Employee.all  # 職員の情報を全て取得
  end

  def create
    @note = current_parent.notes.build(note_params)

    if @note.save
      flash[:notice] = "連絡帳を作成しました"
      redirect_to note_path(@note)
    else
      @employees = Employee.all  # 保存に失敗した場合、再度職員の情報を取得
      render :new
    end
  end

  def edit
    @employees = Employee.all
  end

  def update
    if @note.update(note_params)
      flash[:notice] = "連絡帳を更新しました"
      redirect_to note_path(@note)
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:notice] = "連絡帳を削除しました"
    redirect_to notes_path
  end

  private

  def ensure_correct_parent
    unless @note.parent == current_parent || @note.employee == current_parent.employee
      redirect_to notes_path, alert: 'アクセス権限がありません。'
    end
  end

  def set_note
    @note = Note.find(params[:id]) # current_parent.notesの制限を取り除いた
  end

  def note_params
    params.require(:note).permit(:title, :content, :employee_id)
  end
end