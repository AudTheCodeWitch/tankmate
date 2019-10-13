class MaintenancesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @maintenances = @user.maintenances
  end

  def show
    @maintenance = Maintenance.find(params[:id])
  end

  def new
    @maintenance = Maintenance.new
  end

  def create
    if maintenance_params[:tank_id].length == 1
      @maintenance = Maintenance.new(maintenance_params)
      @maintenance.task_id = set_task(maintenance_params)
      @maintenance.errors.add(:tank_id, :blank, message: "must be selected.")
      @maintenance.save
      render :new and return
      else
      maintenance_params[:tank_id].each do |t|
        unless t.blank?
          @maintenance = Maintenance.new(maintenance_params)
          @maintenance.tank_id = t
          @maintenance.task_id = set_task(maintenance_params)
          render :new and return unless @maintenance.save
        end
      end
    end
    redirect_to user_maintenances_path(current_user)
  end

  def edit
    @maintenance = Maintenance.find(params[:id])
  end

  def update
    @maintenance = Maintenance.find(params[:id])
    if @maintenance.update(maintenance_params)
      redirect_to user_maintenances_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    redirect_to user_maintenances_path(current_user)
  end

  private

  def maintenance_params
    params.require(:maintenance).permit(
        :due,
        :complete,
        :notes,
        :task_id,
        tank_id: [],
        :task_attributes => :title
      )
  end

  def set_task(maintenance_params)
    if maintenance_params[:task_id].blank?
      t = Task.find_or_create_by(title: maintenance_params[:task_attributes][:title].capitalize)
      t.id
    else
      maintenance_params[:task_id]
    end
  end

end
