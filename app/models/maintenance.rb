class Maintenance < ApplicationRecord
  belongs_to :task
  belongs_to :tank
  accepts_nested_attributes_for :task

  validates :due, presence: true
  validate :due_cannot_be_in_the_past

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

  def self.today
    where('due =?', Date.today)
  end

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
