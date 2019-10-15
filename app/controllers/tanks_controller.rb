class TanksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]
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
    @tank = Tank.new(tank_params)
    if @tank.save
      redirect_to user_tank_path(current_user, @tank)
    else
      render :new
    end

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
    @user = User.find(@tank.user_id)
    @tank.fish.each do |f|
      f.destroy
    end
    @tank.plants.each do |p|
      p.destroy
    end
    @tank.maintenances.each do |m|
      m.destroy
    end
    @tank.destroy
    redirect_to user_path(@user)
  end

  private

  def redirect_if_not_authorized
    redirect_to '/' unless current_user == Tank.find(params[:id]).user
  end

  def tank_params
    params.require(:tank).permit(:name, :size, :description, :image, :user_id)
  end
end
