class Task < ApplicationRecord
  has_many :maintenances
  has_many :tanks, through: :maintenances
end
