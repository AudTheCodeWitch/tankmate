class PlantsController < ApplicationController
  before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]
  def new
    @plant = Plant.new(tank_id: params[:tank_id])
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to user_tank_path(current_user, plant_params[:tank_id])
    else
      render :new
    end
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      redirect_to user_tank_path(current_user, plant_params[:tank_id])
    else
      render 'edit'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def destroy
    @plant = Plant.find(params[:id])
    tank = Tank.find(@plant.tank_id)
    @plant.destroy
    redirect_to user_tank_path(current_user, tank)
  end

  private

  def redirect_if_not_authorized
    unless current_user == Plant.find(params[:id]).tank.user
      redirect_to user_tank_path(Plant.find(params[:tank_id]).user, params[:tank_id])
    end
  end

  def plant_params
    params.require(:plant).permit(:species, :image, :quantity, :tank_id)
  end
end
