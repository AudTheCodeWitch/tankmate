class PlantsController < ApplicationController

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new
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

  end
end
