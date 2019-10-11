class Maintenance < ApplicationRecord
  belongs_to :task
  belongs_to :tank
end
