class TanksController < ApplicationController
  def index
    @tanks = Tank.all
  end
end
