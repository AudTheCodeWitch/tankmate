class TasksController < ApplicationController

  def index
    @tasks = current_user.tasks
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to user_maintenances_path(current_user)
    else
      render 'edit'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_maintenances_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end
end

