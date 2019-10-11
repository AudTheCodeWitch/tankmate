class FishController < ApplicationController

  def new
    @fish = Fish.new
  end

  def create
    params[:fish_quantity].times do
      @fish = Fish.create(fish_params)
    end
  end

  def update
    @fish = Fish.find(params[:id])
  end

  def edit
    @fish = Fish.find(params[:id])
  end

  def destroy
    @fish = Fish.find(params[:id])
  end

  private

  def fish_params
    params.require(:fish).permit(:species, :image, :tank_id)

  end
end
