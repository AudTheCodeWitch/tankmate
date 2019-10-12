class Tank < ApplicationRecord
  belongs_to :user
  has_many :fish
  has_many :plants
  has_many :maintenances
  has_many :tanks, through: :maintenances
end
