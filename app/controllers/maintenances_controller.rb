class MaintenancesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @maintenances = @user.maintenances
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end

end
