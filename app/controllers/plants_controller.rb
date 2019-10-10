class PlantsController < ApplicationController
  def index
    @plant = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new
  end

  def show
    @plant = Plant.find(params[:id])
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

  def fish_params

  end
end
