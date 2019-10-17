class Maintenance < ApplicationRecord
  belongs_to :task
  belongs_to :tank
  accepts_nested_attributes_for :task

  validates :due, presence: true
  validate :due_cannot_be_in_the_past

  def initialize(params)
    super(params)
    set_task(params) if params
  end

  def set_task(maintenance_params)
    if maintenance_params[:task_id].blank?
      t = Task.find_or_create_by(title: maintenance_params[:task_attributes][:title].capitalize)

    else
      t = Task.find(maintenance_params[:task_id])
    end
    self.task = t
  end

  def due_cannot_be_in_the_past
    if due.present? && due < Date.today
      errors.add(:due, "date can't be in the past")
    end
  end

  def status
    complete ? "Complete" : "Incomplete"
  end

  def self.by_tank(tank)
    where(tank: tank)
  end

  def self.by_task(task)
    where(task: task)
  end

  # scope :active, -> { where state: 'active' }
  scope :today, -> { where 'due =?', Date.today }

  # def self.today
  #   where('due =?', Date.today)
  # end

  def self.upcoming
    where('due >?', Date.today)
  end

  def self.overdue
    where('due <?', Date.today)
  end

  def self.by_complete
    where(complete: true)
  end

  def self.by_incomplete
    where(complete: false)
  end

  def self.this_week
    where('due >=?', Date.today) && where('due <=?', (Date.today + 7))
  end


end
