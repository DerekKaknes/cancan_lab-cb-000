class NotesController < ApplicationController
  load_and_authorize_resource :note
  load_and_authorize_resource through: :note

  def index
  end

  def show
  end

  def new
  end

  def create
    @note.user = current_user
    @note.visible_to = note_params[:visible_to]
    if @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @note.update_attributes(note_params)
    if @note.save
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
