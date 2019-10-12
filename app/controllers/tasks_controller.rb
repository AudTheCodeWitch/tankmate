class TasksController < ApplicationController

  # I don't think we want this. Users will see maintenance through users/maintenances
  # def show
  #   @task = Task.find(params[:id])
  # end

  def new
    @task = Task.new
    @task.maintenances.build
  end

  def create
    @task = Task.new(task_params)
    binding.pry
    if @task.save
      @task.update(task_params)
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
    params.require(:task).permit(
        :due,
        :title,
        :notes,
        :maintenances_attributes => [:complete, tank_id: []]
    )
  end
end

