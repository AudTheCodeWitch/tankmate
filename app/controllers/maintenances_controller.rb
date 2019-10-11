class MaintenancesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @maintenances = @user.maintenances
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    if @maintenance.save
      redirect_to user_maintenances_path(current_user)
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    redirect_to user_maintenances_path(current_user)
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(:due, :complete?, :notes, :tank_id, :task_id)
  end

end
