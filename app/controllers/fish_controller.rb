class FishController < ApplicationController
  def index
    @fishes = Fish.all
  end

  def new
    @fish = Fish.new
  end

  def create
    @fish = Fish.new
  end

  def show
    @fish = Fish.find(params[:id])
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

  end
end
