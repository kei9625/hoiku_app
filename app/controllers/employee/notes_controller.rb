class Employee::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @parents = Parent.all
  end

  def show_parent_notes
    @parent = Parent.find(params[:parent_id])
    @notes = @parent.notes
  end

  def new
    @note = Note.new
    @parents = Parent.all
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to employee_note_path(@note), notice: '連絡帳を作成しました'
    else
      @parents = Parent.all
      render :new
    end
  end

  def edit
    @parents = Parent.all
  end

  def show
  end

  def update
    if @note.update(note_params)
      redirect_to employee_note_path(@note), notice: '連絡帳を更新しました'
    else
      @parents = Parent.all
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to employee_notes_path, notice: '連絡帳を削除しました'
  end



  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :parent_id)
  end

end
