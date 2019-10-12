class Maintenance < ApplicationRecord
  belongs_to :task
  belongs_to :tank
  accepts_nested_attributes_for :task


end
