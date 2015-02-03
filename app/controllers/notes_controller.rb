require 'byebug'
class NotesController < ApplicationController
  before_action :set_note, only: [:edit, :show,:update,:destroy]

  def index
    @task = Task.find(params[:id])
    @task.notes
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def show
  end

  def create
    @note = Note.new(note_params)
    @note.task = Task.find(params[:task_id])
    if @note.save
      redirect_to list_path(@note.task.list_id)
    else
      render :edit
    end
  end

  def update
    if @note.update(note_params)
      redirect_to list_tasks(@note.task_id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body,:task_id)
  end
end

=begin
   task_notes GET    /tasks/:task_id/notes(.:format)     notes#index
              POST   /tasks/:task_id/notes(.:format)     notes#create
new_task_note GET    /tasks/:task_id/notes/new(.:format) notes#new
    edit_note GET    /notes/:id/edit(.:format)           notes#edit
         note GET    /notes/:id(.:format)                notes#show
              PATCH  /notes/:id(.:format)                notes#update
              PUT    /notes/:id(.:format)                notes#update
              DELETE /notes/:id(.:format)                notes#destroy
=end
