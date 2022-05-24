class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)				# You cannot use params directly here, you have to use strong attributes. That is why we define the private method below.
    @task.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def show; end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, false)
  end
end
