require 'byebug'
class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :show, :update, :destroy]

  def index
    @list = List.find(params[:id])
    @list.tasks
  end

  def show
  end

  def new
    @task = List.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.list = List.find(params[:list_id])
    if @task.save
      redirect_to list_path(@task.list_id)
    else
      render :edit
    end
  end

  def update
    if @task.update(task_params)
      redirect_to list_path(@task.list_id)
    else
      render :edit
    end
  end

  def destroy
    list = @task.list
    @task.destroy
    redirect_to list_path(list.id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:label,:complete,:list_id)
  end
end


=begin
list_tasks GET    /lists/:list_id/tasks(.:format)     tasks#index
           POST   /lists/:list_id/tasks(.:format)     tasks#create
 edit_task GET    /tasks/:id/edit(.:format)           tasks#edit
      task GET    /tasks/:id(.:format)                tasks#show
           PATCH  /tasks/:id(.:format)                tasks#update
           PUT    /tasks/:id(.:format)                tasks#update
           DELETE /tasks/:id(.:format)                tasks#destroy
=end
