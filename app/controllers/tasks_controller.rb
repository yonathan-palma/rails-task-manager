class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    # raise
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    # raise
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entry
    end
  end

  def edit
  end

  def update
    @task.update(params_task)
    redirect_to tasks_path(@tasks)
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def params_task
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
