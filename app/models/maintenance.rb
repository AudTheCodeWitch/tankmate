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


end
