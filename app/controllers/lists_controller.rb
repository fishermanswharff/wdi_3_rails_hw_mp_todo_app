class ListsController < ApplicationController

  # what is this doing?
  before_action :set_list, only: [:show,:edit,:update,:destroy]

  def index
    @lists = List.all
  end

  # why isn't there anything in this method? how does it work?
  def show
  end

  # is there something saved here? what is this `List.new` anyway?
  def new
    @list = List.new
  end

  # why is this empty?
  def edit
  end

  # what are these list_params? what does @list.save return?
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  # this looks familiar
  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :complete)
  end

  # why only use this method for the :show, :edit, :update, and :destroy methods?
  def set_list
    @list = List.find(params[:id])
  end
end