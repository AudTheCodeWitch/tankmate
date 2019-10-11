class PlantsController < ApplicationController

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
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def destroy
    @plant = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:species, :image, :quantity, :tank_id)
  end
end
