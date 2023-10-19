class Parent::NotesController < ApplicationController
  before_action :set_parent
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = @parent.notes
  end

  def show
  end

  def new
    @note = @parent.notes.build
  end

  def create
    @note = @parent.notes.build(note_params)
    if @note.save
      redirect_to parent_notes_path(@parent), notice: '連絡帳を作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to parent_note_path(@parent, @note), notice: '連絡帳を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to parent_notes_path(@parent), notice: '連絡帳を削除しました'
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_note
    @note = @parent.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end