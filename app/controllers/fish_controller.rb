class FishController < ApplicationController
  before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]
  def new
    @fish = Fish.new(tank_id: params[:tank_id])
  end

  def index
    if params[:search] && !params[:search].blank?
      @fishes = Fish.where("species like ?", "%#{params[:search].titleize}%")
      if @fishes.empty?
        flash[:notice] = "Fish not found"
        @fishes = Fish.all
        render :index
      end
    else
      @fishes = Fish.all
    end
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

  def redirect_if_not_authorized
    unless current_user == Fish.find(params[:id]).tank.user
      redirect_to user_tank_path(Tank.find(params[:tank_id]).user, params[:tank_id])
    end
  end

  def fish_params
    params.require(:fish).permit(:species, :image, :quantity, :tank_id)
  end
end
