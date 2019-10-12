class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.find_or_initialize_by(title: task_params[:title])
    if @task.save
      redirect_to user_maintenances_path(current_user)
    else
      render :new
    end
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
    tank = Tank.find(@task.tank_id)
    @task.destroy
    redirect_to user_maintenances_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:species, :image, :quantity, :tank_id)
  end
end

