class FishController < ApplicationController

  def new
    @fish = Fish.new(tank_id: params[:tank_id])
  end

  def create
    @fish = Fish.new(fish_params)
    if @fish.save
      redirect_to user_tank_path(current_user, fish_params[:tank_id])
    else
      render :new
    end
  end

  def update
    @fish = Fish.find(params[:id])
    if @fish.update(fish_params)
      redirect_to user_tank_path(current_user, fish_params[:tank_id])
    else
      render 'edit'
    end
  end

  def edit
    @fish = Fish.find(params[:id])
  end

  def destroy
    @fish = Fish.find(params[:id])
    tank = Tank.find(@fish.tank_id)
    @fish.destroy
    redirect_to user_tank_path(current_user, tank)
  end

  private

  def fish_params
    params.require(:fish).permit(:species, :image, :quantity, :tank_id)

  end
end
