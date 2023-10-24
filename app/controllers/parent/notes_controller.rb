class Parent::NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_parent.notes
  end

  def show
  end

  def new
    @note = current_parent.notes.build
  end

  def create
    @note = current_parent.notes.build(note_params)
    
    
    
    if @note.save
      redirect_to parent_notes_path, notice: '連絡帳を作成しました'
    else
      puts @note.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to parent_note_path(@note), notice: '連絡帳を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to parent_notes_path, notice: '連絡帳を削除しました'
  end

  private

  def set_note
    @note = current_parent.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end