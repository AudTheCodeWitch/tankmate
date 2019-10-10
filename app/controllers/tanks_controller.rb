class TanksController < ApplicationController
  def index
    @tanks = Tank.all
  end

  def show
    @tank = Tank.find(params[:id])
  end

  def new
    @tank = Tank.new
  end

  def create
    @tank = Tank.create(tank_params)
    redirect_to user_tank_path(@tank)
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to user_tank_path, alert: "User not found."
      else
        @tank = user.tanks.find_by(id: params[:id])
        redirect_to user_tanks_path(user), alert: "Tank not found." if @tank.nil?
      end
    else
      @tank = Tank.find(params[:id])
    end
  end

  def update
    @tank = Tank.find(params[:id])
    if @tank.update(tank_params)
      redirect_to user_tank_path(@tank)
    else
      render 'edit'
    end
  end

  def destroy
    @tank = Tank.find(params[:id])
  end

  private

  def tank_params
    params.require(:tank).permit(:name, :size, :description, :image, :user_id)
  end
end
