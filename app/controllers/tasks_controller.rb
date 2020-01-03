class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
  end

  def new
  @task = @list.tasks.new  
  end
  
  def create
  @task = @list.tasks.new(task_params)  
    if @task.save
      redirect_to tasks_path(@list)
    else
      render :new
    end
  end
  
  private

  def set_board
   @board = Board.find(params[:list_id]) 
  end
  
  def set_list
    @list = List.find_by_id(params[:list_id])
  end
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
  params.require(:task).permit(:name, :description)  
  end
  
end